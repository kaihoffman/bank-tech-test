class BalanceSheet

  attr_accessor :transactions

def initialize
  @transactions = Array.new
end

def add_to_transactions(transaction)
  @transactions.push(transaction)
end


end