class HomeController < ApplicationController
  
  before_filter :signed_in_redirect
  
  def signed_in_redirect
    if user_signed_in?
      redirect_to dashboard_path
    end
  end
  
  def index
    render :layout => "home_app"
  end
end
