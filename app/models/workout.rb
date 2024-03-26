class Workout < ApplicationRecord
  has_many :blocks, dependent: :destroy
  has_many :exercises, through: :blocks
end
