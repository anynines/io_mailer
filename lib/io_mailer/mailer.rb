class IOMailer::Mailer < ActionMailer::Base
  
  def mailer(recipients, from_address, subject, text)
    @text = text
    
    mail( :to => recipients,
          :from => from_address,
          :subject => subject) do |format|
      format.html
    end
  end
  
end