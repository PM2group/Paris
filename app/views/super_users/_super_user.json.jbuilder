json.extract! super_user, :id, :super_user_id, :super_user_password, :super_user_name, :created_at, :updated_at
json.url super_user_url(super_user, format: :json)
