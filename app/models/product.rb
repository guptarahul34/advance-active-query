class Product < ApplicationRecord
    # belongs_to :customer
    has_many :orders

    enum status: [:in_stock, :out_of_stock, :coming_soon]

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :capacity, presence: true, numericality: true
    validates :status, presence: true, inclusion:  { in: Product.statuses } 

   
    default_scope { where(is_active:true) }
end
