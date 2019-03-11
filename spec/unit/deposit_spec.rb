describe "Deposit Unit Tests" do
    let(:account) { Account.new }
    it "Responds to :deposit method" do
        expect(account).to respond_to(:deposit)
    end

end