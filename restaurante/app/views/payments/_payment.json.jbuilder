json.extract! payment, :id, :card, :option, :created_at, :updated_at
json.url payment_url(payment, format: :json)
