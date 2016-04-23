class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(orders_params)
    @order.user = current_user
    if cart.present? && @order.save
      create_cart
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end

  def show
  end

  private

    def orders_params
      params.require(:order).permit(:phone, :address, :name)
    end

    def cart
      session[:cart]
    end

    def create_cart
      items = Product.find cart.keys
      items.each do |item|
        count = cart[item.id.to_s]
        price = item.price * count
        @order.items.create product: item, count: count, price: price
      end
      session[:cart] = nil
    end
end
