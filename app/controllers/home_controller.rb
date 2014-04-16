class HomeController < ApplicationController
	layout 'vitrine'
  def index
  end
  def connexIncrip
    if mi_user_signed_in?
      redirect_to :controller => "dashboard", :action =>"index"
    end
  end
  def partenaires
  end
  def contact
  end
  def about
  end
  def send_mail
    # protect_from_forgery with: :null_session
    name = params[:home][:name]
    email = params[:home][:email]
    message = params[:home][:message]
    MinstantEmail.contact(name, email, message).deliver
    redirect_to contact_home_index_path, notice: 'message envoyé avec success'
  end
end
