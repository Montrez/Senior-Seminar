json.extract! trip, :id, :estimated_expense_id, :destination, :purpose, :todate, :fromdate, :created_at, :updated_at
json.url trip_url(trip, format: :json)
