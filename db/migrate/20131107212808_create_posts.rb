class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :url
      t.references :user
      t.integer :vote_count, default: 0
      t.timestamps
    end
  end
end
