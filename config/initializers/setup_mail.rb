ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "nitinbarai.virtueinfo@gmail.com",
  :password             => "nitin777",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "156.cms.ntn"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
