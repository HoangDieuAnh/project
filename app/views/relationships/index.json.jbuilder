json.array!(@relationships) do |relationship|
  json.extract! relationship, :id, :society_id, :user_id, :role
  json.url relationship_url(relationship, format: :json)
end
