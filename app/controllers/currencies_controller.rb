class CurrenciesController < ApplicationController
  before_action :authenticate_user!

  respond_to :json, :html

  def index
    respond_with Currency.all
  end
end
