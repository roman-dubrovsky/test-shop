class CartsController < ApplicationController
  def create
    count = params[:cart][:count].to_i

    cart = session[:cart]
    if cart.present?
      cart[product.id] = 0 if cart[product.id].nil?
      cart[product.id] += count
    else
      session[:cart] = {product.id => count}
    end

    redirect_to :back
  end

  def destroy
    cart = session[:cart]
    if cart.present?
      cart[product.id.to_s] = nil
      session[:cart].compact!
    end

    redirect_to :back
  end

  private

    def product
      @_product ||= Product.find(params[:product_id])
    end
end
