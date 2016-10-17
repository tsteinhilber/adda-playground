json.extract! artist, :id, :name_first, :name_last, :email, :website, :category, :status, :date_start, :slug, :created_at, :updated_at
json.url artist_url(artist, format: :json)