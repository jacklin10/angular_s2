class CustomersController < ApplicationController
  respond_to :html, :json

  def index
    @customers = Customer.all
    respond_with(@customers)
  end

  def lookup_customer
    @customers = Customer.all
    respond_with(@customers)
  end

end
