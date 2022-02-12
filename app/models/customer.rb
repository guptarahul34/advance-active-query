class Customer < ApplicationRecord

    has_many :orders
    

    validates :fname, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
    validates :lname, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true, length: { is: 10 }, numericality: true
end
