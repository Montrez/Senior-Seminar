json.extract! request, :id, :department, :percentrequested, :status, :estimated_expense_id, :actual_expense_id, :created_at, :updated_at
json.url request_url(request, format: :json)
