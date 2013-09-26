SteamExample::Application.routes.draw do
  root "authentication#new"
  post "/auth/steam/callback" => "authentication#callback"
end
