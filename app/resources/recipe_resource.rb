class RecipeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :photo, :string
  attribute :name, :string
  attribute :ingredients, :string
  attribute :category_id, :integer
  attribute :dietary_restrictions, :string
  attribute :user_id, :integer

  # Direct associations

  has_many   :ratings

  has_many   :comments

  belongs_to :user

  # Indirect associations

end
