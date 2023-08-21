class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :courses, through: :reservations
end
