class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :description
    validates :price
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :date_of_delivery_id
  end

  belongs_to :user
  # has_one :purchase
end
