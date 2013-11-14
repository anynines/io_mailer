require 'pry'
require 'action_mailer'
require 'yaml'

module IOMailer
  autoload :Mailer, File.expand_path('../io_mailer/mailer', __FILE__)
  autoload :Configuration, File.expand_path('../io_mailer/configuration', __FILE__)
  
  @@config = nil
  
  def self.config
    @@config = IOMailer::Configuration.new(File.expand_path('config/io_mailer.yml'))  if @@config.nil?
    return @@config
  end
end