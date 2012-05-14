class UserMailer < ActionMailer::Base
  default :from => "newsletters@searleconsulting.com",
          :return_path => 'newsletters@searleconsulting.com'
  
  def registration_confirmation(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Thank You for Registering")
  end
end
