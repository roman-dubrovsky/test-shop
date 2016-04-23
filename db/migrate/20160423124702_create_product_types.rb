class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_kinds do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
