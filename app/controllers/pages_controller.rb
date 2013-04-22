class PagesController < HighVoltage::PagesController
  layout :layout_for_page
  skip_filter :authenticate_user!

  protected

    def layout_for_page
      'content_parent'
      # If you need a different layout for different pages:
      # case params[:id]
      # when 'home'
      #   'content_parent'
      # else
      #   'application'
      # end
    end
end
