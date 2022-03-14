class Recipe < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :category_id, :presence => true

  validates :dietary_restrictions, :presence => true

  validates :ingredients, :presence => true

  validates :name, :uniqueness => { :scope => [:user_id] }

  validates :name, :presence => true

  validates :photo, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
