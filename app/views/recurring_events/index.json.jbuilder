json.array!(@recurring_events) do |recurring_event|
  json.extract! recurring_event, :name
  json.url recurring_event_url(recurring_event, format: :json)
end
