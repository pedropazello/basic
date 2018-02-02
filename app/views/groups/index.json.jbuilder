json.recordsTotal Group.all.count
json.recordsFiltered @groups.total_count

json.data do |groups|
  groups.array!(@groups) do |group|
    json.extract! group, :id, :name
    json.url group_url(group, format: :json)
  end
end
