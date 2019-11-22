# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :category_id
      t.integer :product_id

      t.timestamps
    end
    add_index :tags, :category_id
    add_index :tags, :product_id
  end
end
