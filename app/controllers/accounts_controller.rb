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


private

  def account_params
    params.require(:account).permit(:name, :currency_id, :balance)
  end
end
