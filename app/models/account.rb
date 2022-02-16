class Account < ApplicationRecord
  
  belongs_to :user

  #Validations 
  validates_presence_of :user_id, :account_number, :bk_branch, :bk_number, :balance

  #Avoids users to insert strange values like 222.222
  validates :balance, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**3) },
    format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
end
