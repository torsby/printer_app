class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :line_item
  def validate
    errors.add(:amount, "should be one or more")unless amount.nil? || amount > 0
    errors.add(:price, "should be a positive number")unless price.nil? || price > 0.0
  end
end
