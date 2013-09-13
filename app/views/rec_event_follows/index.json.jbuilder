json.array!(@rec_event_follows) do |rec_event_follow|
  json.extract! rec_event_follow, :recurring_event_id, :user_id
  json.url rec_event_follow_url(rec_event_follow, format: :json)
end
