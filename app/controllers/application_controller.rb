class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # Custom layouts for devise controllers http://goo.gl/OKTKT
  def layout_by_resource
    devise_controller? ? "login" : "application"
  end

  # devise overrides
  def after_sign_in_path_for(resource)
    home_index_path
  end

  def after_sign_out_path_for(resource)
    page_path("index")
  end

end
