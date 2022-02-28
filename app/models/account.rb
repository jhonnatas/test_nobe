class Account < ApplicationRecord
  
  belongs_to :user
  has_many :account_transactions, dependent: :destroy

  #Validations 
  validates_presence_of :user_id, :account_number, :bk_branch, :bk_number, :balance
  validates :user, presence: true

  #Avoids users to insert strange values like 222.222
  validates :balance, numericality: { greater_than_or_equal_to: 0, message: 'Valor deve ser maior do que zero.', less_than: BigDecimal(10**3) },
    format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }

  def debits
    AccountTransaction.where(account_id: id, tr_type: 'D').sum(:amount)
  end

  def credits
    AccountTransaction.where(account_id: id, tr_type: 'C').sum(:amount) 
  end

  def account_balance
    b = self[:balance] - debits + credits
  end

  def prev_balance(date, app_id)

    debits =  AccountAppointment.where(:account_id => id, :tr_type => 'D').where('account_transactions.date <= ?', date).where('account_transactions.id <?', app_id).order(created_at: :desc, deb_cre: :desc).sum(:amount)
    credits =  AccountAppointment.where(:account_id => id, :tr_type => 'C').where('account_transactions.date <= ?', date).where('account_transactions.id <?', app_id).order(created_at: :desc, deb_cre: :desc).sum(:amount)

    result = balance - debits + credits

  end
end

