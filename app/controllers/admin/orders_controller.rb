class Admin::OrdersController < Admin::BaseController
  helper_method :order

  def index
    @orders = Order.order(updated_at: :desc)
  end

  def show
  end

  def update
    order.update(orders_params)
    redirect_to :back
  end

  private

    def order
      @_order ||= Order.find(params[:id])
    end

    def orders_params
      params.require(:order).permit(:state)
    end
end
