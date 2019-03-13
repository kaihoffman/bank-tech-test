require 'bank_account'

describe "Bank Account feature tests" do

  let(:account) { Account.new }

# ```
# As an account holder
# In order to have money in my account
# I want to be able to deposit money.
# ```
  it "can handle deposits" do
    expect { account.deposit(1000) }.not_to raise_error
    expect(account.balance).to eq(1000.00)
  end
# ```
# As an account holder
# In order to later know when money was deposited or withdrawn,
# I want to be able to store a date for my operation
# ```

  it "can handle dates for transactions" do
    account.deposit(1000)
    expect(account.date).to eq(Time.now.strftime("%d/%m/%Y"))
  end

# ```
# As an account holder,
# In order to have access to my money
# I want to be able to withdraw money.
# ```
  it "can handle withdrawals" do
    account.deposit(1000)
    expect { account.withdraw(200) }.not_to raise_error
    expect { account.withdraw(200) }.to change { account.balance }.by(-200.00)
  end

# ```
# As an account holder,
# Because money comes in decimals,
# I would like to be able to withdraw, deposit and view my balance with 2 decimals
# ```
  it "returns sums in decimals from account methods" do
    account.deposit(100.55)
    account.withdraw(0.50)
    expect(account.balance).to eq(100.05)
  end

# ```
# As an account holder,
# In order to not go over my funds
# I want to only be able to withdraw what is available in my account
# ```
  it "protects against overdrawing" do
    account.deposit(1)
    expect { account.withdraw(99_999) }.to raise_error
  end

# ```
# As an account holder,
# So that I know how much money is in my account
# I want to be able to request a balance statement
# ```
  it "Allows user to request a list of transactions on a balance statement" do
    expect { account.balance_sheet.transactions }.not_to raise_error
  end

  it "Adds deposits to the list of transactions as hash in an array" do
    expect { account.deposit(500, "12/02/2018") }.to change { account.balance_sheet.transactions }.by([])
  end

  it "Adds withdrawals to the list of transactions as a hash in an array" do
    account.deposit(300)
    account.withdraw(250, "12/02/2019") 
    expect(account.balance_sheet.transactions[1][:date]).to include("12/02/2019")
  end
# ```
# As an account holder,
# So that I can follow my funds over time
# I want to be able to see my statements ordered by date
# ```

end

describe "Acceptace criteria" do

  let(:account) { Account.new }

  # Given a client makes a deposit of 1000 on 10-01-2012
  # And a deposit of 2000 on 13-01-2012
  # And a withdrawal of 500 on 14-01-2012
  # When she prints her bank statement
  # Then she would see
  it "conduct the acceptance criteria steps" do
    account.deposit(1000, "10/01/2012")
    account.deposit(2000, "13/01/2012")
    account.withdraw(500, "14/01/2012")
    expect{ account.balance_sheet.print_balance_sheet }.to output("date || credit || debit || balance\n14/01/2012 ||  || 500.00 || 2500.00\n13/01/2012 || 2000.00 ||  || 3000.00\n10/01/2012 || 1000.00 ||  || 1000.00\n").to_stdout
  # date || credit || debit || balance
  # 14/01/2012 || || 500.00 || 2500.00
  # 13/01/2012 || 2000.00 || || 3000.00
  # 10/01/2012 || 1000.00 || || 1000.00
  end

end
