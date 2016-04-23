class OrdersController < ApplicationController
  before_action :authenticate_user!

  helper_method :order

  def index
    @orders = orders_scope
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

    def order
      @_order ||= orders_scope.find(params[:id])
    end

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

    def orders_scope
      Order.where(user: current_user).order(id: :desc)
    end
end
