require "rubygems"
require "bundler"

Bundler.require

require "openid/store/filesystem"
require "omniauth/strategies/steam"

puts "Please inform your Steam API key: "
api_key = ENV["STEAM_WEB_API_KEY"] || STDIN.gets.strip

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :steam, api_key, :storage => OpenID::Store::Filesystem.new("/tmp")
end

get "/" do
  "<a href='/auth/steam'>Authenticate with Steam</a>"
end

post "/auth/steam/callback" do
  content_type "text/plain"
  request.env["omniauth.auth"].info.to_hash.inspect
end
