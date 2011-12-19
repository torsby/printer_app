class CheckoutController < ApplicationController
  before_filter :initialize_cart
  def index
    @order = Order.new
    @page_title = "Checkout"

    redirect_to :controller => 'carts'
  end

  def place_order
  end

  def thank_you
  end
end
