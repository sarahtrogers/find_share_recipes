class Recipe < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :presence => true

  validates :photo, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
