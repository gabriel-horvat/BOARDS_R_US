class Board < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, inclusion: { in: ["Snowboard", "Skateboard", "Surfboard"] }
end
