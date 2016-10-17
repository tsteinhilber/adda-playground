json.extract! membership, :id, :team_id, :user_id, :lead, :created_at, :updated_at
json.url membership_url(membership, format: :json)