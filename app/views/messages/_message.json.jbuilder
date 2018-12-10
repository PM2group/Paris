json.extract! message, :id, :send_id, :reception_id, :mess, :send_date, :created_at, :updated_at
json.url message_url(message, format: :json)
