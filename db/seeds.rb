# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#user = User.create!(email: 'jhonnatas.aires@gmail.com', password: '123456')

5.times {
  Account.create!(
    account_number: Faker::Bank.account_number, 
    bk_number: Faker::Bank.bsb_number, 
    bk_branch: Faker::Bank.name,
    details: Faker::Lorem.sentences,
    user_id: 1,
    account_active: true,
    balance: 100.0)
}


