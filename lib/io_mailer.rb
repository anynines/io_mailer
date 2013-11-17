require 'pry'
require 'action_mailer'
require 'yaml'

module IOMailer
  autoload :NotificationMailer, File.expand_path('../io_mailer/notification_mailer', __FILE__)
  autoload :Configuration, File.expand_path('../io_mailer/configuration', __FILE__)
  autoload :InputConverter, File.expand_path('../io_mailer/input_converter', __FILE__)
  
  @@config = nil
  
  def self.config
    @@config = IOMailer::Configuration.new(File.expand_path('config/io_mailer.yml'))  if @@config.nil?
    return @@config
  end
  
  def self.base_directory
    File.expand_path("../", File.dirname(__FILE__))
  end
end