class Products::Item::Cell < Application::Cell
  def show
    render
  end

  private

    property :title, :price, :image
end
