# Overidden initially to set a cookie for the subdomain after the user registers
class MyDevise::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

end
