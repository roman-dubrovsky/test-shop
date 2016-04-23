class CartsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    count = params[:cart][:count].to_i

    cart = session[:cart]
    if cart.present?
      cart[product.id] = 0 if cart[product.id].nil?
      cart[product.id] += count
    else
      session[:cart] = {product.id => count}
    end

    redirect_to root_path
  end
end
