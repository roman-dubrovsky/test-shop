class Products::Show::Cell < Application::Cell
  def show
    render
  end

  private

    property :title
end
