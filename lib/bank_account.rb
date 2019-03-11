require 'balance_sheet'

class Account
  attr_reader :balance, :date

  def initialize
    @balance = 0.0
    balance_sheet = BalanceSheet.new
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance += amount
    @date = date
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise "Balance exceeded" if amount >= @balance

    @balance -= amount
    @date = date
  end

end
