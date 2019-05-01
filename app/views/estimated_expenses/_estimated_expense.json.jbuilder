json.extract! estimated_expense, :id, :type, :total, :source_id, :status, :created_at, :updated_at
json.url estimated_expense_url(estimated_expense, format: :json)
