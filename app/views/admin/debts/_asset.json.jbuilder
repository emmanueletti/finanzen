json.extract! debt, :id, :name, :owner, :category, :starting_balance, :created_at, :updated_at
json.url debt_url(debt, format: :json)
