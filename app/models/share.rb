class Share < ApplicationRecord
  # Direct associations

  belongs_to :recipe

  # Indirect associations

  # Validations

  validates :recipe_id, presence: true

  validates :recipient_id, presence: true

  # Scopes

  def to_s
    recipe.to_s
  end
end
