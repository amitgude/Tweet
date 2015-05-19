Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '379198185605472', 'a35d4b1485ea18c9919ba1c6537fefa8'
end
