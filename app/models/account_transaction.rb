class AccountTransaction < ApplicationRecord
  belongs_to :account

  #Validations
  validates_presence_of :account_id, :tr_type, :amount


end
