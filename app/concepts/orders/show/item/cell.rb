class Orders::Show::Item::Cell < Application::Cell
  def show
    render
  end

  property :count, :price, :product
  delegate :image, :title, to: :product, prefix: true
end
