class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :comment, :string
  attribute :recipe_id, :integer
  attribute :user_id, :integer

  # Direct associations

  # Indirect associations

end
