class Admin::Orders::Cell < Orders::Cell
  def show
    render
  end

  private

    def title
      "Orders"
    end
end
