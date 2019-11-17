json.extract! product, :id, :name, :desc, :price, :created_at, :updated_at, :images
json.url product_url(product, format: :json)
