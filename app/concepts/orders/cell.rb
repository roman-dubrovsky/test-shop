class Orders::Cell < Application::Cell
  def show
    render
  end

  private

    def title
      "My orders"
    end
end
