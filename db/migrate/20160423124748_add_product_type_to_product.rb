class AddProductTypeToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :kind, index: true
  end
end
