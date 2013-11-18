Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']

  provider :facebook, '596135093776095', '8e58c809e47707a745f81b949c79108e'
end