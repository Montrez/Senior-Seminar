require "administrate/base_dashboard"

class EstimatedExpenseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    trip: Field::BelongsTo,
    requests: Field::HasMany,
    id: Field::Number,
    expense_type: Field::String,
    total: Field::Number.with_options(decimals: 2),
    requests_id: Field::Number,
    status: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    comment: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :trip,
    :requests,
    :id,
    :expense_type,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :trip,
    :requests,
    :id,
    :expense_type,
    :total,
    :requests_id,
    :status,
    :created_at,
    :updated_at,
    :comment,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :trip,
    :requests,
    :expense_type,
    :total,
    :requests_id,
    :status,
    :comment,
  ].freeze

  # Overwrite this method to customize how estimated expenses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(estimated_expense)
  #   "EstimatedExpense ##{estimated_expense.id}"
  # end
end
