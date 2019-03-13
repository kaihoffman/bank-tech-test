class Printer

def output(transactions)
  puts "date || credit || debit || balance"
  transactions.reverse.each do | transactions |
    if transactions[:credit_amount] == nil
      transactions[:credit_amount] == "    "
    else transactions[:credit_amount] = sprintf('%.2f', transactions[:credit_amount])
    end
    
    if transactions[:debit_amount] == nil
      transactions[:debit_amount] == "    "
    else transactions[:debit_amount] = sprintf('%.2f', transactions[:debit_amount])
    end

    transactions[:balance] = sprintf('%.2f', transactions[:balance])

    puts "#{transactions[:date]} || #{transactions[:credit_amount]} || #{transactions[:debit_amount]} || #{transactions[:balance]}"
  end
end

end