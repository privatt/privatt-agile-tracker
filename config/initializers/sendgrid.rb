if ENV['SENDGRID_USERNAME']
  ActionMailer::Base.smtp_settings = {
    :address              => "smtp.sendgrid.net",
    :authentication       => :plain,
    :enable_starttls_auto => true,
    :domain               => ENV['SENDGRID_DOMAIN'],
    :user_name            => ENV['SENDGRID_USERNAME'],
    :password             => ENV['SENDGRID_PASSWORD'],
    :port                 => ENV['SENDGRID_PORT']
  }
end
