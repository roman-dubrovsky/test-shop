class Cart::Item::Cell < Application::Cell
  def show
    render
  end

  private

    property :title, :price, :id

    def cart
      session[:cart]
    end

    def count
      cart[id.to_s]
    end

    def total_price
      count * price
    end
end
