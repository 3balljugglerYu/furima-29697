class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city         
    validates :addresses   
    validates :building     
    validates :phone_number 
    validates :order       
  end
  
end
