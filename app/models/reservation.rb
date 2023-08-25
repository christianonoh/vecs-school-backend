class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :date, :city, presence: true

  def as_json(options = {})
    super(options.merge(include: :course))
  end
end
