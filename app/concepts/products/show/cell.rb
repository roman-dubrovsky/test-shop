class Products::Show::Cell < Application::Cell
  def show
    render
  end

  private

    property :title, :description, :image, :price, :kind
    delegate :title, to: :kind, prefix: true
end
