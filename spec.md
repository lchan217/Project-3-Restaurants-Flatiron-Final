# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - User has many locations
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - Location belongs to user
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  - User has_many :restaurants, through: :locations
  - Restaurants has_many :users, through: :locations
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  - User has_many :restaurants, through: :locations  
  - Restaurants has_many :users, through: :locations
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  - location has a city and a state
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - item and restaurant must have names
  - location must have a state
  - user must have a username and password, and username must be unique
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  -URL: /all_restaurants_in_database
  - methods both used in Location Model
- [x] Include signup (how e.g. Devise)
  - users#new (no devise)
- [x] Include login (how e.g. Devise)
  - sessions#new (no devise)
- [x] Include logout (how e.g. Devise)
  - sessions#destroy (no devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - Omniauth and Github
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - restaurants/id/show/id
  - restaurants/id/index
- [x ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  -  restaurants/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - flash alerts

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
