# Overriden so you can perform actions before and after confirmations happen in Devise
class MyDevise::ConfirmationsController < Devise::ConfirmationsController

  def new
    # If you click link to resend confirm instructions
    super
  end

  def create
    # If you have entered your email and click the send button to receive new instructions
    super
  end

  def show
    # Was creating Apartment db when doing the show
    super
  end

end
