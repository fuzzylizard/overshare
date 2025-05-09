class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.text :message
      t.integer :views

      t.timestamps
    end
  end
end
