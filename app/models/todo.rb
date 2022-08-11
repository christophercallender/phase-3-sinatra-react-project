class Todo < ActiveRecord::Base
  belongs_to :category

  def cleanup_database
    # Delete all categories
    Category.all.each { |category| category.destroy }

    # Find or create a category for each todos' category_name
    Todo.all.each do |todo|
      Category.find_or_create_by(name: todo.category_name)
    end

    # Update each todos' category_id with the associated category's id
    Todo.all.each do |todo|
      todo.category_id = Category.find_by(name: todo.category_name).id
      todo.save
    end
  end
end
