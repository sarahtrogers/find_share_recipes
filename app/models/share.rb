class Share < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :recipient_id, :presence => true

  # Scopes

  def to_s
    recipe.to_s
  end

end
