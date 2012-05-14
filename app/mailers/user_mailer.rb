class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://floating-sky.herokuapps.com"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end  
  
end
