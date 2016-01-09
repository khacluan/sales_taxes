class Order < ActiveRecord::Base
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  def total
    order_products.sum(:price)
  end

  def tax_price
    products.map(&:tax_price).reject(&:nil?).sum
  end
end
