require_relative 'printer'
class BalanceSheet

  attr_accessor :transactions

  def initialize
    @transactions = Array.new
  end

  def add_to_transactions(transaction)
    @transactions.push(transaction)
  end

  def print_balance_sheet
    Printer.new.output(@transactions)
    end

end
