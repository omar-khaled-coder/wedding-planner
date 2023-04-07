class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :items, dependent: :destroy
  has_many_attached :photos
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
    # validates :short_description, presence: true, length: { maximum: 100 }
end
