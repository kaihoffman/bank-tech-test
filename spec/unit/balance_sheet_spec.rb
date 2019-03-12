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

  it "can store a withdrawal transaction in the balance sheet" do
    accountdouble = double("Account double")
    test_withdrawal_amount = 250
    allow(accountdouble).to receive(:withdraw).and_return("withdrawal")
    accountdouble.withdraw(test_withdrawal_amount)
    subject.add_to_transactions("withdrawal")
    expect(subject.transactions).to include("withdrawal")
  end

  it "can respond to a #print_balance_sheet method" do
    expect(subject).to respond_to(:print_balance_sheet)
  end
    

end
