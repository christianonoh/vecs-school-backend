class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :date, :city, :user_id, :course_id, presence: true
end
