class Reservation < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :date, presence: true
end
