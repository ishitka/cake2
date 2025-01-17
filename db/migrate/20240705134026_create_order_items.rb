# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :production_status, null: false
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      
      t.timestamps
    end
  end
end
