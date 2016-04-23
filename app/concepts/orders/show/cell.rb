class Orders::Show::Cell < Application::Cell
  def show
    render
  end

  property :name, :phone, :address, :total_price, :state, :items
end
