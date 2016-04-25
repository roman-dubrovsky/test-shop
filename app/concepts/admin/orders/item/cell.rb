class Admin::Orders::Item::Cell < Orders::Item::Cell
  builds do |model, _options|
    case model.state
    when 'new'
      Admin::Orders::Item::New::Cell
    when 'created'
      Admin::Orders::Item::Created::Cell
    when 'send'
      Admin::Orders::Item::Send::Cell
    end
  end

  private

    property :user
    delegate :email, to: :user, prefix: true
    date_property :updated_at

    def action
      render('action') if update_action_value.present?
    end

    def update_action_title
      'update'
    end

    def update_action_class
    end

    def update_action_value
    end
end
