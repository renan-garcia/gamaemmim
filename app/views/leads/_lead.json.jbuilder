json.extract! lead, :id, :name, :email, :ip, :created_at, :updated_at
json.url lead_url(lead, format: :json)
