class AccountTransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_active, only: [:show, :edit, :update, :destroy]


  def index
    if (params[:start_date].present? && params[:end_date].present?)
      @account_filter = AccountTransaction.where(created_at: [params[:start_date].to_date..params[:end_date].to_date], account_id: params[:origin_account_id])
      #@account_filter = AccountTransaction.all 
    else  
      redirect_to account_path(params[:origin_account_id].to_i), notice: 'Por favor, defina as datas de início e fim.'
    end
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
    params.require(:account_transaction).permit(:date, :doc_ref, :tr_type, :description, :amount, :account_id, :origin_account_id, :start_date, :end_date)
  end
  
  def check_active
    redirect_to accounts_path, alert: 'Por favor, escolha uma conta ativa.' unless params[:account_active] == "true"
  end

end




