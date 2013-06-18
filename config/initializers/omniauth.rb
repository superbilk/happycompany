OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :xing, APP_CONFIG['xing_consumer_key'], APP_CONFIG['xing_consumer_secret']
end
