json.recordsTotal User.all.count
json.recordsFiltered @users.total_count

json.data do |users|
  users.array!(@users) do |user|
    json.extract! user, :id, :first_name, :last_name, :email, :group_name
    json.url user_url(user, format: :json)
  end
end
