json.array!(@user_profiles) do |user_profile|
  json.extract! user_profile, :nickname, :sms_number
  json.url user_profile_url(user_profile, format: :json)
end
