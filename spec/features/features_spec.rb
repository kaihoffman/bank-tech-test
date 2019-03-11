require 'bank_account'

describe "Bank Account feature tests" do

  let(:account) {Account.new}

# ```
# As an account holder
# In order to have money in my account
# I want to be able to deposit money.
# ```
  it "can handle deposits" do
    expect { account.deposit(1000) }.not_to raise_error
    expect(account.balance).to eq(1000)
  end
# ```
# As an account holder
# In order to later know when money was deposited or withdrawn,
# I want to be able to store a date for my operation
# ```

# ```
# As an account holder,
# In order to have access to my money
# I want to be able to withdraw money.
# ```

# ```
# As an account holder,
# Because money comes in decimals,
# I would like to be able to withdraw, deposit and view my balance with 2 decimals
# ```

# ```
# As an account holder,
# In order to not go over my funds
# I want to only be able to withdraw what is available in my account
# ```

# ```
# As an account holder,
# So that I know how much money is in my account
# I want to be able to request a balance statement
# ```

# ```
# As an account holder,
# So that I can follow my funds over time
# I want to be able to see my statements ordered by date
# ```

end
