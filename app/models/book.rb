require "date"
class Book < ApplicationRecord
    belongs_to :author

    date = Date.today+1
    scope :order_in_desc, -> { order(id: :desc) }
    scope :out_for_print, -> { where(out_for_print: true) }
    scope :max_value_for_order, -> { out_for_print.where("no_of_order = ?",5) }
    scope :price_more_than, -> (amount) { order_in_desc.where("price > ?",amount) }
    scope :created_by_date, -> (date) { where("created_at < ?",date) unless date.blank? }
    
    def self.cost_more_than(amount)
        where("price > ?",amount)
    end

    def self.create_with_date(date)
        where("created_at < ?",date) if date.present?
    end
end
