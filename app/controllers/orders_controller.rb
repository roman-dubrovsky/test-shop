class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  helper_method :order

  def index
    @orders = orders_scope
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(orders_params)
    if cart.present? && @order.valid?
      create_user_if_empty!
      @order.user = current_user
      @order.save
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

    def create_user_if_empty!
      if current_user.nil?
        user = User.new
        user.save(validate: false)
        user.email = "user#{user.id}@example.com"
        user.password = Devise.friendly_token(8)
        user.save
        sign_in(user)
      end
    end
end
