Todo.destroy_all
Category.destroy_all

puts "🌱 Seeding..."

10.times { Category.create(name: Faker::Music.genre) }

30.times do
  Todo.create(
    description: Faker::Movie.quote,
    date_due: Faker::Date.between(from: Date.today, to: Date.today + 1.year),
    time_due: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1.day),
    priority: %w[High Medium Low].sample,
    completed: [true, false].sample,
    category_id: Category.all.sample.id,
    category_name: nil
  )
end

Todo.all.each do |todo|
  todo.category_name = Category.find(todo.category_id).name
  todo.save
end

puts "✅ Seeded!"
