require "administrate/base_dashboard"

class RequestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    estimated_expense: Field::BelongsTo,
    actual_expense: Field::BelongsTo,
    id: Field::Number,
    department: Field::String,
    percentrequested: Field::Number.with_options(decimals: 2),
    status: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    comment: Field::Text,
    amount_from_total: Field::Number.with_options(decimals: 2),
    destination: Field::String,
    expense_type: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :estimated_expense,
    :actual_expense,
    :id,
    :department,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :estimated_expense,
    :actual_expense,
    :id,
    :department,
    :percentrequested,
    :status,
    :created_at,
    :updated_at,
    :comment,
    :amount_from_total,
    :destination,
    :expense_type,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :estimated_expense,
    :actual_expense,
    :department,
    :percentrequested,
    :status,
    :comment,
    :amount_from_total,
    :destination,
    :expense_type,
  ].freeze

  # Overwrite this method to customize how requests are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(request)
  #   "Request ##{request.id}"
  # end
end
