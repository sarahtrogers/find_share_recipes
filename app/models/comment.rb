class Comment < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :comment, :presence => true

  validates :recipe_id, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    comment
  end

end
