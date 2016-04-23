class Navigation::Cell < Application::Cell
  def show
    render
  end

  private

    def menu
      render 'menu'
    end

    def is_active?(path)
      "active" if current_page? path
    end

    def navigation_class
      "navbar-default"
    end
end
