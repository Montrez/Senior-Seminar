json.extract! expense_report, :id, :actual_expense_id, :trip_id, :status, :created_at, :updated_at
json.url expense_report_url(expense_report, format: :json)
