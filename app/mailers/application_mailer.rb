class ApplicationMailer < ActionMailer::Base
  default from: 'backloggroup58@gmail.com' #uses this mail if not mentioned in confog/enviromnents/development.rb
  layout 'mailer'
end
