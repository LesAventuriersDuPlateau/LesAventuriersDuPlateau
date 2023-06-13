json.extract! event, :id, :title, :description, :price, :image_url, :city, :zip_code, :start_date, :duration, :created_at, :updated_at
json.url event_url(event, format: :json)
