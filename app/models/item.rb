class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_one_attached :image
  belongs_to :user
  
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price, numericality: { greater_than: 299 ,less_than: 10000000, message: 'Out of setting range' }
    validates :image
  end

  with_options numericality: { other_than: 0} do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end


end
