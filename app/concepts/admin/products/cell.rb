class Admin::Products::Cell < Products::Cell
  def show
    render
  end

  private

    def filter_url
      admin_products_path
    end
end
