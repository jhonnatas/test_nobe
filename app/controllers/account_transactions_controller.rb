class AccountTransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_active

  def index
  
  end

  def new
    @account_transaction = AccountTransaction.new 
  end

  def create
    @account_transaction = AccountTransaction.new(account_transaction_params)
    if @account_transaction.save
      redirect_to account_transactions_path, notice: 'Lançamento realizado!'
    else
      flash[:alert] = @account_transaction.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @account_transaction = AccountTransaction.find(params[:id])
  end

  def edit
  end

  def update
    @account_transaction = AccountTransaction.find(params[:id])
    if @account_transaction.update(account_transaction_params)
      redirect_to account_transaction_path(@account_transaction), notice: "A transação foi realizada!"
    else
      flash[:alert] = @account.errors.full_messages.join(', ')
      render :edit
    end 
  end 

  private 
  def account_transaction_params 
    params.require(:account_transaction).permit(:date, :doc_ref, :tr_type, :description, :amount, :account_id)
  end
  
  def check_active
    redirect_to accounts_path, alert: 'Por favor, escolha uma conta ativa.' unless params[:account_active] == "true"
  end
end




