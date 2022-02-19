class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = Account.where(user_id: current_user.id )#Only the current user's accounts listed    
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

  private 

  def account_params
    params.require(:account).permit(:id, :account_active, :account_number, :bk_branch, :bk_number, :details, :balance, :user_id)
  end
end
