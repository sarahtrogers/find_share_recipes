class ShareResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_id, :integer
  attribute :recipient_id, :integer

  # Direct associations

  # Indirect associations

end
