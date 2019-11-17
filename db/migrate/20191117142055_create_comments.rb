class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :text
      t.integer :object_id
      t.string :object_type

      t.timestamps
    end
  end
end
