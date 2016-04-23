class Admin::Products::Item::Cell < Application::Cell
  def show
    render
  end

  private

    property :title, :price, :id
    date_property :created_at, :updated_at
end
