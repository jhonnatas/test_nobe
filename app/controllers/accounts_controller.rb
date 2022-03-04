require 'util/appoints'

class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = Account.where(user_id: current_user.id ) #Only the current user's accounts listed    
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    if @account.save
      redirect_to account_path(@account), notice: "A conta foi criada!"
    else
      flash[:alert] = @account.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      redirect_to account_path(@account), notice: "A conta foi atualizada!"
    else
      flash[:alert] = @account.errors.full_messages.join(', ')
      render :edit
    end 
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to account_index_path
  end

  def transference 
    @conta_dest     = Account.find(params[:dest_account_id])
    @aconta_origem  = Account.find(params[:origin_account_id])
    saldo_origem = @aconta_origem.account_balance
    value_debt = params[:balance].to_d
      
    if (value_debt > 0)
      if (value_debt <= saldo_origem)
        msg = Appoints.call(params[:origin_account_id],params[:dest_account_id], value_debt)
        redirect_to accounts_path, notice: msg
      else
        flash.now[ :alert ] = 'Saldo indisponível para esta operação!'
        render :show
      end
    end
  end

  private 
  def account_params
    params.require(:account).permit(:id, :account_active, :account_number, :bk_branch, :bk_number, :details, :balance, :user_id)
  end
end
