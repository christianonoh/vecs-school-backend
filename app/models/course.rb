class Course < ApplicationRecord
  validates :name, :description, :photo, :price, :teacher, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000 }
end
