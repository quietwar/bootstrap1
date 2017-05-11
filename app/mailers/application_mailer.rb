class ApplicationMailer < ActionMailer::Base
  default from: 'from@hiddengeniusproject.org'  && 'from@hgs.hiddengeniusproject.org'
  layout 'mailer'
end
