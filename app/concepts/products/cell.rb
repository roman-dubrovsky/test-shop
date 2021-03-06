class Products::Cell < Application::Cell
  def show
    render
  end

  private

    def filter_url
      root_path
    end

    def filter
      concept("products/filter/cell", options[:search], url: filter_url)
    end
end
