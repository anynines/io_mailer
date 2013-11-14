class IOMailer::NotificationMailer < ActionMailer::Base
  
  def notify(recipients, from_address, subject, text)
    @text = text
    
    mail( :to => recipients,
          :from => from_address,
          :subject => subject) do |format|
      format.html { render }
    end
  end
  
end