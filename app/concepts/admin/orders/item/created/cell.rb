class Admin::Orders::Item::Created::Cell < Admin::Orders::Item::Cell
  private
    def update_action_title
      'send'
    end

    def update_action_class
      'btn-success'
    end

    def update_action_value
      :send
    end
end
