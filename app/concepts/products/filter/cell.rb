class Products::Filter::Cell < Application::Cell
  def show
    render
  end

  private

    property :kind_id_eq

    def options_for_kind
      options_from_collection_for_select(Product::Kind.all, "id", "title", kind_id_eq)
    end

    def url
      options[:url]
    end
end
