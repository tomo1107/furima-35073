class PurchaseDeliveryInformation
  include ActiveModel::Model
  attr_accessor :price, :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone

  with_options presence: true do
    validates :price
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone, numericality: { only_integer: true, message: 'Input only number' }, length: { maximum: 11 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    DeliveryInformation.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                               building: building, phone: phone, purchase_id: purchase.id)
  end
end
