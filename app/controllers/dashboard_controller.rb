class DashboardController < ApplicationController
  before_filter :authenticate_mi_user!
  before_action :login_email
  layout "dashboard"
  def index
  end
  def users
    redirect_to openfire_users_path
  end
  #def salons
    #api = OpenfireApiRuby::RoomService.new(:url => "http://localhost:9090/", :secret => "n84a1588")
    #api.add_room!(:roomname => "room", :jid => "jid", :subdomain => "groupchat")
    # api.add_muc_service!(:subdomain=>'demo-service', :description=>'this is a demo muc service')
  #end
  def setting
  end
  private
  def login_email
    @login_email=current_mi_user.email
  end
end
