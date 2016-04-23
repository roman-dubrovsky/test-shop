class Cart::Cell < Application::Cell
  def show
    render
  end

  private

    def cart
      session[:cart]
    end

    def items
      if cart.present?
        @_items ||= Product.find cart.keys
      else
        @_items = []
      end
    end

    def total_price
      items.map do |item|
        cart[item.id.to_s] * item.price
      end.sum
     end
end
