json.extract! sale, :id, :description, :unit_price, :quantity, :created_at, :updated_at
json.url sale_url(sale, format: :json)
