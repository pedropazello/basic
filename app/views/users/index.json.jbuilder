json.total_count @users.total_count

json.users do |users|
  users.array!(@users) do |user|
    json.extract! user, :id, :first_name, :last_name, :email
    json.url user_url(user, format: :json)
  end
end

