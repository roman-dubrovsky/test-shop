class ProductsController < ApplicationController
  helper_method :product

  def index
    @search = Product.ransack(filter_params)
    @products = @search.result.order(id: :desc).paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  private

    def product
      @_product ||= Product.find(params[:id])
    end

    def filter_params
      params[:q]
    end
end
