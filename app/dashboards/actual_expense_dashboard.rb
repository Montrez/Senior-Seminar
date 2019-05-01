require "administrate/base_dashboard"

class ActualExpenseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    expense_report: Field::BelongsTo,
    requests: Field::HasMany,
    id: Field::Number,
    expense_type: Field::String,
    total: Field::Number.with_options(decimals: 2),
    requests_id: Field::Number,
    status: Field::Boolean,
    dateincurred: Field::DateTime,
    imageurl: Field::String,
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
    :expense_report,
    :requests,
    :id,
    :expense_type,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :expense_report,
    :requests,
    :id,
    :expense_type,
    :total,
    :requests_id,
    :status,
    :dateincurred,
    :imageurl,
    :created_at,
    :updated_at,
    :comment,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :expense_report,
    :requests,
    :expense_type,
    :total,
    :requests_id,
    :status,
    :dateincurred,
    :imageurl,
    :comment,
  ].freeze

  # Overwrite this method to customize how actual expenses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(actual_expense)
  #   "ActualExpense ##{actual_expense.id}"
  # end
end
