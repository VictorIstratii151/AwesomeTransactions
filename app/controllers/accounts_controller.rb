class AccountsController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  def index
    respond_with Account.all
  end
end
