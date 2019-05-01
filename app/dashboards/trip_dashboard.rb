require "administrate/base_dashboard"

class TripDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    submitter: Field::BelongsTo,
    expense_report: Field::HasOne,
    approvers: Field::HasMany,
    managers: Field::HasMany,
    estimated_expenses: Field::HasMany,
    requests: Field::HasMany,
    id: Field::Number,
    estimated_expenses_id: Field::Number,
    managers_id: Field::Number,
    destination: Field::String,
    purpose: Field::Text,
    todate: Field::DateTime,
    fromdate: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    approvers_id: Field::Number,
    status: Field::Boolean,
    comment: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :submitter,
    :expense_report,
#    :approvers,
    :managers,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :submitter,
    :expense_report,
    :approvers,
    :managers,
    :estimated_expenses,
    :requests,
    :id,
    :estimated_expenses_id,
    :managers_id,
    :destination,
    :purpose,
    :todate,
    :fromdate,
    :created_at,
    :updated_at,
    :approvers_id,
    :status,
    :comment,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :submitter,
    :expense_report,
    :approvers,
    :managers,
    :estimated_expenses,
    :requests,
    :estimated_expenses_id,
    :managers_id,
    :destination,
    :purpose,
    :todate,
    :fromdate,
    :approvers_id,
    :status,
    :comment,
  ].freeze

  # Overwrite this method to customize how trips are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(trip)
  #   "Trip ##{trip.id}"
  # end
end
