class RatingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :rating, :integer
  attribute :recipe_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :user

  # Indirect associations

end
