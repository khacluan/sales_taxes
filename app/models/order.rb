class Order < ActiveRecord::Base
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  def subtotal
    order_products.map {|op| op.product.price * op.quantity }.sum
  end
end
