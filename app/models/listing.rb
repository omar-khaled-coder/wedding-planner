class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :items, dependent: :destroy
  has_many_attached :photos
  # validates :short_description, presence: true, length: { maximum: 100 }
end
