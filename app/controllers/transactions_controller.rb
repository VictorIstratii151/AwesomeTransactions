class TransactionsController < ApplicationController
  before_action :authenticate_user!

  respond_to :json, :html

  def index
    respond_with Transaction.all
  end

  def create
    respond_with Transaction.create(transaction_params)
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  def destroy
    respond_with Transaction.destroy(params[:id])
  end

private

  def transaction_params
    params.require(:transaction).permit(:amount, :description, :transaction_date, :account_id)
  end
end
