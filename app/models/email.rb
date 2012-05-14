class Email < ActiveRecord::Base

  def send_email
    @recipients = "hellraiser.u1@gmail.com"
    @from = "no-reply@gmail.com"
    @subject = "TEST MAIL SUBJECT"
    @body = "<br>TEST MAIL MESSAGE"
    @content_type = "text/html"
  end

end
