class MinstantEmail < ActionMailer::Base
  default from: "admin@minstant.com"
  default to: "yaan.yan@yahoo.fr"
  def registration_confirmation(user)
  	@user=user
  	mail(:to => @user.email,:subject => "Votre compte xmpp")
  end
  def contact(name,email,message)
  	@name=name
  	@email=email
  	@message=message
  	mail(:from => @email,:subject => "Contact minstant")
  end
end
