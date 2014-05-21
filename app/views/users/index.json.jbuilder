json.array!(@users) do |user|
  json.extract! user, :id, :name, :first_name, :middle_name, :last_name, :email, :phone, :mobile, :encrypted_password, :salt
  json.url user_url(user, format: :json)
end
