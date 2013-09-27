require "omniauth/strategies/steam"
require "openid/store/filesystem"

puts "Please inform your Steam API key: "
api_key = ENV["STEAM_WEB_API_KEY"] || STDIN.gets.strip

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, api_key, :storage => OpenID::Store::Filesystem.new("/tmp")
end
