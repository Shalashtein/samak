json.extract! location, :id, :user_id, :lat, :long, :created_at, :updated_at
json.url location_url(location, format: :json)
