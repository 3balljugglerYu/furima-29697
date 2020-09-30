class OrderShipping
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "is invalid. No hyphen (-) required"}
  end
  
  # validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    order = Order.create( user_id: user_id, item_id: item_id )
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id )

  end

end