module FeatureMacros

  # options - :login=>[:auto, :manual, :none], :user
  def visit_as(path, options={:login=>:auto})
    @current_user = options[:user] || ( @current_user || FactoryGirl.create(:user) )
    visit_handler(options[:login], @current_user, path)
  end

  def manual_login(user, path=nil)
    visit path if path
    fill_in 'Email', :with=>user.email
    fill_in 'Password', :with=>user.password
    click_button('Sign In')
  end

  private

  def visit_handler(option, user, path)
    case option
    when :auto || 'auto'
      login_as(user)
      visit path
    when :manual || 'manual'
      manual_login(user, path)
    when :none || 'none'
      visit path
    end
  end

end
