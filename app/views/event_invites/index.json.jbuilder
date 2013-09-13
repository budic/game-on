json.array!(@event_invites) do |event_invite|
  json.extract! event_invite, :status
  json.url event_invite_url(event_invite, format: :json)
end
