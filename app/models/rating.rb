class Rating < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :rating, :presence => true

  validates :recipe_id, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    rating
  end

end
