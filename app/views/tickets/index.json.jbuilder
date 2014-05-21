json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :price, :startdate, :closedate, :maxnumber, :description
  json.url ticket_url(ticket, format: :json)
end
