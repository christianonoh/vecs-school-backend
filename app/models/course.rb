class Course < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, :description, :photo, :price, :teacher, presence: true
  validates :name, :teacher, length: { minimum: 2, maximum: 25 }
  validates :description, length: { minimum: 10, maximum: 500 }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100_000 }
end
