class CategoriesController < ApplicationController
  # set :default_content_type, "application/json"

  get "/categories" do
    categories = Category.all
    categories.to_json
  end
end
