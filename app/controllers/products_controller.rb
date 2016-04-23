class ProductsController < ApplicationController
  helper_method :product

  def index
    @products = Product.order(id: :desc).paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  private

    def product
      @_product ||= Product.find(params[:id])
    end
end
