class CreateOrders < ActiveRecord::Migration[7.0]
  def change
      create_table :orders do |t|
      t.datetime :order_date_time
      t.string :client_name
      t.string :client_phone
      t.string :client_email
      t.string :delivery_address
      t.integer :total_amount
      t.integer :payment_status,  default: 0

      t.timestamps
    end
  end
end
