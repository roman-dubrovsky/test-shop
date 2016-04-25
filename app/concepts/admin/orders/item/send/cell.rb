class Admin::Orders::Item::Send::Cell < Admin::Orders::Item::Cell
  private
    def update_action_title
      'confirm'
    end

    def update_action_class
      'btn-info'
    end

    def update_action_value
      :confirmed
    end
end
