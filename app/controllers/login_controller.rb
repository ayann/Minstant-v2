class LoginController < ApplicationController
  def index
    if mi_user_signed_in?
      redirect_to :controller => "dashboard", :action =>"index"
    else
      redirect_to "/log_in"
    end
  end
end
