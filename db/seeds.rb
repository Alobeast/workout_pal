require_relative '../lib/data'

puts "reinitializing database"
Workout.destroy_all
Block.destroy_all
Exercise.destroy_all

puts "seeding database..."

SeedData::MY_HASH.each do |year, dates|
  dates.each do |workout, workout_infos|
    new_workout = Workout.create!(category: workout_infos["type"])

    workout_infos["blocks"].each do |block, block_infos|
      new_block = new_workout.blocks.create!(mode: block_infos["type"], format: block_infos["format"])

      block_infos["exercises"].each do |exercise, description|
        new_exercise = new_block.exercises.create!(description: description)
      end
    end
  end
end


Block.find_each(batch_size: 1000) do |block|
  block.update(mode: block.mode.upcase)

  updated_mode = block.mode.tr('É', 'E')

  block.update(mode: updated_mode) if block.mode != updated_mode
end


blocks_with_series = Block.where("mode LIKE ?", "%SERIES")

blocks_with_series.each do |block|
  # Append ' repos' to the format string
  updated_format = block.format.to_s + " repos"

  # Update the record with the new format
  block.update(format: updated_format)
end
