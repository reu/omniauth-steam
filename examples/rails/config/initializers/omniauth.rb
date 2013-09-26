require "omniauth/strategies/steam"
require "openid/store/filesystem"

puts "Please inform your Steam API key: "
api_key = STDIN.gets.strip

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, api_key, :storage => OpenID::Store::Filesystem.new("/tmp")
end
