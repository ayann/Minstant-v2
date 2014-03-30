class DashboardController < ApplicationController
  before_filter :authenticate_mi_user!
  before_action :login_email
  layout "dashboard"
  def index
  end
  def users
    redirect_to openfire_users_path
  end
  def groups
    
  end
  def salons
    
  end
  def setting
    
  end
  private
  def login_email
    @login_email=current_mi_user.email
  end
end
