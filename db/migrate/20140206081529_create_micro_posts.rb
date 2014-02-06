class CreateMicroPosts < ActiveRecord::Migration
  def change
    create_table :micro_posts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
	add_index :micro_posts , [:user_id, :created_at]
  end
end
