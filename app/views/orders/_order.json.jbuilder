json.extract! order, :id, :date, :sub_total, :taxes, :total, :restaurant_id, :created_at, :updated_at
json.url order_url(order, format: :json)
