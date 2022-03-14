json.extract! recipe, :id, :photo, :name, :ingredients, :category_id, :dietary_restrictions, :user_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
