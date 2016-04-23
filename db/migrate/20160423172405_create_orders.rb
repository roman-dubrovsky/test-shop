class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state
      t.references :user, index: true
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps null: false
    end
  end
end
