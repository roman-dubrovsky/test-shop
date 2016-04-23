class Orders::Item::Cell < Application::Cell
  def show
    render
  end

  private

    property :id, :state
    date_property :created_at

    def render_order_state
      render 'state'
    end

    def label_class
      case state
      when 'new'
        'label-success'
      when 'created'
        'label-warning'
      when 'send'
        'label-info'
      when 'confirmed'
        'label-default'
      end
    end
end
