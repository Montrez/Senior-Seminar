require "administrate/base_dashboard"

class ExpenseReportDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    submitter: Field::BelongsTo,
    trip: Field::BelongsTo,
    approvers: Field::HasMany,
    managers: Field::HasMany,
    actual_expenses: Field::HasMany,
    requests: Field::HasMany,
    id: Field::Number,
    actual_expenses_id: Field::Number,
    status: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    submitters_id: Field::Number,
    approvers_id: Field::Number,
    managers_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :submitter,
    :trip,
    :approvers,
    :managers,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :submitter,
    :trip,
    :approvers,
    :managers,
    :actual_expenses,
    :requests,
    :id,
    :actual_expenses_id,
    :status,
    :created_at,
    :updated_at,
    :submitters_id,
    :approvers_id,
    :managers_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :submitter,
    :trip,
    :approvers,
    :managers,
    :actual_expenses,
    :requests,
    :actual_expenses_id,
    :status,
    :submitters_id,
    :approvers_id,
    :managers_id,
  ].freeze

  # Overwrite this method to customize how expense reports are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(expense_report)
  #   "ExpenseReport ##{expense_report.id}"
  # end
end
