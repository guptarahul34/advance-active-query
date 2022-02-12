class Order < ApplicationRecord
     belongs_to :product
     belongs_to :customer
    
    
    enum status: [:booked, :cancelled]
end
