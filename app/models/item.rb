class Item < ApplicationRecord
  PRICE_REGEX = /\A[0-9]+\z/.freeze # 半角数字

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' },
                      format: { with: PRICE_REGEX, message: 'Half-width number' }
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :item_status_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :date_of_delivery_id
    end
  end

  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :ItemStatus
  belongs_to :DeliveryFee
  belongs_to :Prefecture
  belongs_to :DateOfDelivery
end
