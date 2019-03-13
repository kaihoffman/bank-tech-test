class Printer

  def output(transactions)
    puts "date || credit || debit || balance"
    transactions.reverse_each do |lines|
      if lines[:credit_amount].nil?
        lines[:credit_amount] == "    "
      else lines[:credit_amount] = sprintf('%.2f', lines[:credit_amount])
      end
      
      if lines[:debit_amount].nil?
        lines[:debit_amount] == "    "
      else lines[:debit_amount] = sprintf('%.2f', lines[:debit_amount])
      end

      lines[:balance] = sprintf('%.2f', lines[:balance])

      puts "#{lines[:date]} || #{lines[:credit_amount]} || 
      #{lines[:debit_amount]} || #{lines[:balance]}"
    end
  end

end
