class AccountsController < ApplicationController
  def index
    @accounts = Account.all
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
    @account.save
    redirect_to account_path(@account)
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    @account.update(account_params)
    redirect_to account_path(@account)
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to account_index_path
  end

  private 

  def account_params
    params.require(:account).permit(:id, :account_number, :bk_branch, :bk_number, :details, :user_id)
  end
end
