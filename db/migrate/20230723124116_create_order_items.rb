class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.string :product_name
      t.integer :product_price
      t.integer :quantity
      t.integer :subtotal
      t.belongs_to :order

      t.timestamps
    end
  end
end
