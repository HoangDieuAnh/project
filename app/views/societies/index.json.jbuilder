json.array!(@societies) do |society|
  json.extract! society, :id, :name, :regNum, :website, :approved
  json.url society_url(society, format: :json)
end
