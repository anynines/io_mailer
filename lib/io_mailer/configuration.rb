class IOMailer::Configuration
  attr_accessor :config
  
  def initialize(file_location)
    load_config_from_file(file_location)
    configure_mailer
  end
  
  
  private
  
  # Loads the configuration from the specified yaml file.
  def load_config_from_file(file_location)
    raise "There's no configuration file at #{file_location}!" unless File.exists? file_location
    config = YAML.load_file(file_location)
    @config = config
    @config
  end
  
  def configure_mailer
    if @config['delivery_method'].to_sym == :letter_opener
      configure_letter_opener
    else
      configure_action_mailer
    end
  end
  
  def configure_action_mailer
    ::ActionMailer::Base.raise_delivery_errors = true
    ::ActionMailer::Base.delivery_method = @config['delivery_method'].to_sym
    
    ::ActionMailer::Base.smtp_settings = @config['smtp_settings'] if ActionMailer::Base.delivery_method == :smtp
    
    ::ActionMailer::Base.view_paths = File.expand_path('../../../views/mailers', __FILE__)
  end
  
  def configure_letter_opener
    binding.pry
    require "letter_opener"
    
    ActionMailer::Base.raise_delivery_errors = true
    ActionMailer::Base.add_delivery_method :letter_opener, LetterOpener::DeliveryMethod, 
      :location => File.expand_path("./tmp", IOMailer.base_directory)
    ActionMailer::Base.delivery_method = :letter_opener
    ActionMailer::Base.view_paths = File.expand_path('../../../views/mailers', __FILE__)
  end
end