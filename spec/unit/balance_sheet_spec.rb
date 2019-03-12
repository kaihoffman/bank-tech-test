require 'balance_sheet'
require 'bank_account'

describe BalanceSheet do
  let(:balance_sheet) { described_class.new }

  it "can store a deposit transaction in the balance sheet" do
    accountdouble = double("Account double")
    test_deposit_amount = 500
    test_deposit_date = "12/12/2012"
    allow(accountdouble).to receive(:deposit).and_return("transaction")
    accountdouble.deposit(test_deposit_amount, test_deposit_date)
    subject.add_to_transactions("transaction")
    expect(subject.transactions).to include("transaction")
  end
    

end