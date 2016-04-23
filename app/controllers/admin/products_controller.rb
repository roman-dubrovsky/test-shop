class Admin::ProductsController < Admin::BaseController
  helper_method :product

  before_action :set_product, only: [:create, :new]

  def index
    @products = Product.order(id: :desc).paginate(page: params[:page], per_page: 20)
  end

  def new
    render "form"
  end

  def create
    if product.update(product_params)
      redirect_to admin_products_path
    else
      render "form"
    end
  end

  def edit
    render "form"
  end

  def update
    if product.update(product_params)
      redirect_to admin_products_path
    else
      render "form"
    end
  end


  def destroy
    product.destroy
    redirect_to admin_products_path
  end

  private

    def product_params
      params.require(:product).permit(:title, :price, :description, :kind_id, :image)
    end

    def product
      @_product ||= Product.find(params[:id])
    end

    def set_product
      @_product = Product.new
    end
end
