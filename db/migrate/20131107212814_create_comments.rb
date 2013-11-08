class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user
      t.references :commentable, polymorphic: true
      t.integer :vote_count, default: 0
      t.timestamps
    end
  end
end
