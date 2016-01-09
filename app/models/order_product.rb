class OrderProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  before_save :calculate_price_after_tax

  private

  def calculate_price_after_tax
    self.price = product.price_after_tax
  end
end
