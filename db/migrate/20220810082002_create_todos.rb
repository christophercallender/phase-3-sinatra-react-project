class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :description
      t.date :date_due
      t.time :time_due
      t.string :priority
      t.boolean :completed
      t.integer :category_id
      t.string :category_name
      t.timestamps
    end
  end
end
