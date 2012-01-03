# OmniAuth Facebook

This gem is an OmniAuth 1.0 strategy supporting the OpenID Steam API.

## Usage

Add to your `Gemfile`:

```ruby
gem 'omniauth-steam'
```

And then integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :steam, ENV['STEAM_WEB_API_KEY']
end
```

If you are using Rails, you may want to add it to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, ENV['STEAM_WEB_API_KEY']
end
```

You will need to inform your steam web API key to be able to retrive information about the authenticated user. You can request one by filling out [this form](http://steamcommunity.com/dev/apikey).

For additional information, please refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).