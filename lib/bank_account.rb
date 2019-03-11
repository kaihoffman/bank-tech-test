class Account
  attr_reader :balance, :date

  def initialize
    @balance = 0.0
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance += amount
    @date = date
  end

end
