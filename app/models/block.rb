class Block < ApplicationRecord
  belongs_to :workout
  has_many :exercises, dependent: :destroy
end
