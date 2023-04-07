class Item < ApplicationRecord
  belongs_to :listing
  has_one_attached :photo

end
