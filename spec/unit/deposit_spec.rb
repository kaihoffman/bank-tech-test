require 'bank_account'

describe Account do
  subject(:account) {described_class.new}

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

end
