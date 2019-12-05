# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :state, null: false, default: 'active'
      t.integer :count, null: false, default: 0
      t.float :cost, null: false, default: 0

      t.timestamps
    end
  end
end
