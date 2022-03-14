class RecipeCategory < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :category_name, :presence => true

  # Scopes

  def to_s
    category_name
  end

end
