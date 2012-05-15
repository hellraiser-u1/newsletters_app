class UserMailer < ActionMailer::Base
  default :from => "newsletters@searleconsulting.com",
          :return_path => 'newsletters@searleconsulting.com'
  
  def registration_confirmation(user,url)
    @user = user
    @url = url
    #attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Thank You for Registering with Application X")
  end


  def subscription_confirmation(subscriber,url)
    @subscriber = subscriber
    @url = url
    #attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => "#{subscriber.name} <#{subscriber.email}>", :subject => "Subscription to Application X")
  end
  
end
