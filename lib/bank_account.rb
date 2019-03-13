require_relative 'balance_sheet'

class Account
  attr_reader :balance, :date, :balance_sheet

  def initialize
    @balance = 0.00
    @balance_sheet = BalanceSheet.new
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance += amount
    @date = date
    balance_sheet.add_to_transactions({ date: @date, credit_amount: amount, 
      debit_amount: nil, balance: @balance })
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise "Balance exceeded" if amount >= @balance
    
    @balance -= amount
    @date = date
    balance_sheet.add_to_transactions({ date: @date, credit_amount: nil, 
      debit_amount: amount, balance: @balance })
  end

end
