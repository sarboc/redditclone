class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user
      t.references :commentable, polymorphic: true
      t.integer :vote_count
      t.timestamps
    end
  end
end
