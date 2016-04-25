class Admin::OrdersController < Admin::BaseController
  helper_method :order

  def index
    @orders = Order.order(updated_at: :desc)
  end

  def show
  end

  private

    def order
      @_order ||= Order.find(params[:id])
    end

    def orders_params
      params.require(:order).permit(:phone, :address, :name)
    end
end
