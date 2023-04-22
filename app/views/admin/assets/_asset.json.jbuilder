json.extract! asset, :id, :name, :owner, :category, :starting_balance, :created_at, :updated_at
json.url asset_url(asset, format: :json)
