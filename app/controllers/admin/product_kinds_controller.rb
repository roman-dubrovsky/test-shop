class Admin::ProductKindsController < Admin::BaseController
  helper_method :kind

  before_action :set_product_kind, only: [:create, :new]

  def index
    @kinds = Product::Kind.order(id: :desc).paginate(page: params[:page], per_page: 20)
  end

  def new
    render "form"
  end

  def create
    if kind.update(product_kind_params)
      redirect_to admin_product_kinds_path
    else
      render "form"
    end
  end

  def edit
    render "form"
  end

  def update
    if kind.update(product_kind_params)
      redirect_to admin_product_kinds_path
    else
      render "form"
    end
  end


  def destroy
    kind.destroy
    redirect_to admin_product_kinds_path
  end

  private

    def product_kind_params
      params.require(:product_kind).permit(:title)
    end

    def kind
      @_kind ||= Product::Kind.find(params[:id])
    end

    def set_product_kind
      @_kind = Product::Kind.new
    end
end
