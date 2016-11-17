json.extract! user, :id, :name, :nickname, :password_digest, :administrator, :berthday, :created_at, :updated_at
json.url user_url(user, format: :json)