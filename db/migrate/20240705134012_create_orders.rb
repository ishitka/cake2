# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :payment_method, null: false
      t.integer :shipping_cost, null: false
      t.integer :invoice_amount, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.integer :status, null: false
      t.integer :customer_id, null: false
      
      t.timestamps
    end
  end
end
