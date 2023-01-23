FactoryBot.define do 
  factory :account do 
		account_number {Faker::Bank.account_number} 
    bk_number {Faker::Bank.bsb_number}
    bk_branch {Faker::Bank.name}
    details {Faker::Lorem.sentence(word_count: 5)}
    user_id {create(:user).id }
    account_active {true}
    balance {100.0}
	end
end 