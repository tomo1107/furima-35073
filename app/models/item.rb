class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999, message: 'Out of setting range' },
                      numericality: { only_integer: true, message: 'Half-width number' }
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :item_status_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :date_of_delivery_id
    end
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :itemStatus
  belongs_to :deliveryFee
  belongs_to :prefecture
  belongs_to :dateOfDelivery
end
