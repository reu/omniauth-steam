require 'omniauth-openid'
require 'multi_json'

module OmniAuth
  module Strategies
    class Steam < OmniAuth::Strategies::OpenID
      args :api_key

      option :api_key, nil
      option :name, "steam"
      option :identifier, "http://steamcommunity.com/openid"

      uid { steam_id }

      info do
        {
          "nickname" => player["personaname"],
          "name"     => player["realname"],
          "location" => [player["loccityid"], player["locstatecode"], player["loccountrycode"]].compact.join(", "),
          "image"    => player["avatarmedium"],
          "urls"     => {
            "Profile" => player["profileurl"]
          }
        }
      end

      extra do
        { "raw_info" => player }
      end

      private

      def raw_info
        @raw_info ||= options.api_key ? MultiJson.decode(Net::HTTP.get(player_profile_uri)) : {}
      end

      def player
        @player ||= raw_info["response"]["players"].first
      end

      def friend_list
        @friend_list ||= options.api_key ? MultiJson.decode(Net::HTTP.get(player_friends)) : {}
      end

      def friend
        @friend ||= friend_list["friendslist"]['friends'].first
      end

      def steam_id
        openid_response.display_identifier.split("/").last
      end

      def player_profile_uri
        URI.parse("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{options.api_key}&steamids=#{steam_id}")
      end

      def player_friends
        URI.parse("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{options.api_key}&steamid=#{steam_id}&relationship=friend")
      end
    end
  end
end
