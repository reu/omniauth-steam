# OmniAuth Steam

This gem is an OmniAuth 1.0 strategy, supporting the Steam OpenID provider.

## Usage

Add to your `Gemfile`:

```ruby
gem 'omniauth-steam'
```

And then integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :steam, "my-steam-web-api-key"
end
```

If you are using Rails, you may want to add it to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, ENV['STEAM_WEB_API_KEY']
end
```

You will need to provide your Steam Web API key to be able to retrieve information about the authenticated user. You can request one by filling out [this form](http://steamcommunity.com/dev/apikey).

For additional information, please refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).

## Authentication Hash

Here's an example of the *Authentication Hash* available in `request.env['omniauth.auth']`

```ruby
{
  :provider => "steam",
  :uid => "76561198010202071",
  :info => {
    :nickname => "Reu",
    :name => "Rodrigo Navarro",
    :location => "BR",
    :image => "http://media.steampowered.com/steamcommunity/public/images/avatars/3c/3c91a935dca0c1e243f3a67a198b0abea9cf6d48_medium.jpg",
    :urls => {
      :Profile => "http://steamcommunity.com/id/rnavarro1/"
    }
  },
  :credentials => {},
  :extra => {
    :raw_info => {
      :steamid => "76561198010202071",
      :communityvisibilitystate => 3,
      :profilestate => 1,
      :personaname => "Reu",
      :lastlogoff => 1325637158,
      :profileurl => "http://steamcommunity.com/id/rnavarro1/",
      :avatar => "http://media.steampowered.com/steamcommunity/public/images/avatars/3c/3c91a935dca0c1e243f3a67a198b0abea9cf6d48.jpg",
      :avatarmedium => "http://media.steampowered.com/steamcommunity/public/images/avatars/3c/3c91a935dca0c1e243f3a67a198b0abea9cf6d48_medium.jpg",
      :avatarfull => "http://media.steampowered.com/steamcommunity/public/images/avatars/3c/3c91a935dca0c1e243f3a67a198b0abea9cf6d48_full.jpg",
      :personastate => 1,
      :realname => "Rodrigo Navarro",
      :primaryclanid => "103582791432706194",
      :timecreated => 1243031082,
      :loccountrycode => "BR"
    }
  }
}
```
