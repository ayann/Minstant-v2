json.array!(@openfire_users) do |openfire_user|
  json.extract! openfire_user, :id, :name, :username, :groups, :mi_user_id
  json.url openfire_user_url(openfire_user, format: :json)
end
