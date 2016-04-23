class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :count
      t.integer :price

      t.timestamps null: false
    end
  end
end
