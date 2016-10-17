json.extract! client, :id, :name, :category, :website, :status, :created_user, :updated_user, :created_at, :updated_at
json.url client_url(client, format: :json)