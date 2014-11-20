#config/initalizers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.CLIENT_ID, Rails.application.secrets.CLIENT_SECRET, {
    scope: ['email', 'calendar.readonly', 'calendar'],
    access_type: 'offline'}
end