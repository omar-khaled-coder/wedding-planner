class AddListingToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :listing, null: false, foreign_key: true
  end
end
