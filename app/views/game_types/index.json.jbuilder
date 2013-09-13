json.array!(@game_types) do |game_type|
  json.extract! game_type, 
  json.url game_type_url(game_type, format: :json)
end
