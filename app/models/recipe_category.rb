class RecipeCategory < ApplicationRecord
  # Direct associations

  has_many   :recipes,
             foreign_key: "category_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :category_name, presence: true

  # Scopes

  def to_s
    category_name
  end
end
