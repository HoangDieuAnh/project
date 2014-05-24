json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :ticket_id, :integer, :user_id, :amount
  json.url reservation_url(reservation, format: :json)
end
