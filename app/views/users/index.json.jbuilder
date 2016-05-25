json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :score, :references
  json.url user_url(user, format: :json)
end
