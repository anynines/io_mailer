# IO Mailer 

This simple script executes a command provided as command line argument and sends the output results of the script to email addresses. These email addresses can be specified in a configuration file.

# Configuration
* Recipient email addresses can be specified in the config/io_mailer.yml
  file. An example can be found under config/io_mailer.yml.example .

# Usage

* Script execution: bundle exec bin/io_mailer <the script file location or command to execute> (e.g. bundle exec bin/io_mailer ls)
