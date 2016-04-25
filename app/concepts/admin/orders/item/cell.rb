class Admin::Orders::Item::Cell < Orders::Item::Cell
  private

    property :user
    delegate :email, to: :user, prefix: true
    date_property :updated_at
end
