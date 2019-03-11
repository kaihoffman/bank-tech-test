require 'bank_account'

describe Account do
  subject(:account) { described_class.new }

  it "Responds to :deposit method" do
    expect(account).to respond_to(:deposit)
  end

  it "Takes a deposit amount as an argument" do
    expect(account).to respond_to(:deposit).with(1)
  end

  it "Stores a date for the transaction" do
    account.deposit(500)
    expect(account.date).to eq(Time.now.strftime("%d/%m/%Y"))
  end

  it "Responds to :withdraw method and a sum" do
    expect(account).to respond_to(:withdraw).with(1)
  end

  it "Allows a different date in DD/MM/YYYY to be input for a transaction" do
    account.deposit(250, "12/12/2012")
    expect(account.date).to eq("12/12/2012")
  end

end
