class Admin::ProductKinds::Item::Cell < Application::Cell
  def show
    render
  end

  private

    property :title, :id, :products
    date_property :created_at, :updated_at
    delegate :count, to: :products, prefix: true
end
