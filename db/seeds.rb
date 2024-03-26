require_relative '../lib/data'

puts "reinitializing database"
Workout.destroy_all
Block.destroy_all
Exercise.destroy_all

puts "seeding database..."
SeedData::MY_HASH.each do |year, dates|
  # debugger
  dates.each do |workout, workout_infos|
    new_workout = Workout.create!(category: workout_infos["type"])
    # pp values["blocks"]
    workout_infos["blocks"].each do |block, block_infos|
      new_block = new_workout.blocks.create!(mode: block_infos["type"], format: block_infos["format"])

      block_infos["exercises"].each do |exercise, description|
        new_exercise = new_block.exercises.create!(description: description)
      end
    end
  end
    # Workout.create!(category: workout["type"])
end
