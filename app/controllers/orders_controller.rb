class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:order_products)
  end
end
