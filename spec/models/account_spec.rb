require 'rails_helper'

RSpec.describe Account, :type => :model do

	it 'saves with correct account data' do
    account = create(:account)
    expect(account).to be_valid
  end
	
	it 'account is not valid without account number' do
		account = described_class.new(account_number: nil)
		expect(account).not_to be_valid
	end

	it 'account is not valid without bank number' do
		account = described_class.new(bk_number: nil)
		expect(account).not_to be_valid
	end

	it 'account is not valid without bank branch' do
		account = described_class.new(bk_branch: nil)
		expect(account).not_to be_valid
	end

	it 'account is not valid without a balance' do
		account = described_class.new(balance: nil)
		expect(account).not_to be_valid
	end

	it 'has 100.00 as initial balance' do
		account = described_class.new(balance: 100)
		expect(account.account_balance).to eql(100.00)
	end	

end