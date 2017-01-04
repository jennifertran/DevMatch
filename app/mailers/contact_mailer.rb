class ContactMailer < ActionMailer::Base
  # Where it will send the email
  default to: 'jennifer.tran101@gmail.com'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
    mail(from: email, subject: 'Contact Form Message')
  end
  
end