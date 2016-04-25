class Admin::Orders::Item::New::Cell < Admin::Orders::Item::Cell
  private
    def update_action_title
      'create'
    end

    def update_action_class
      'btn-warning'
    end

    def update_action_value
      :created
    end
end
