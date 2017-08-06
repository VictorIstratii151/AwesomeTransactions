class AccountsController < ApplicationController
  before_action :authenticate_user!

  respond_to :json, :html

  def index
    @user = current_user
    respond_with @user.accounts.all
  end

  def create
    respond_with current_user.accounts.create(account_params)
  end

  def show
    respond_with current_user.accounts.find(params[:id])
  end

  def destroy
    respond_with Account.destroy(params[:id])
  end

private

  def account_params
    params.require(:account).permit(:name, :currency_id, :balance)
  end
end
