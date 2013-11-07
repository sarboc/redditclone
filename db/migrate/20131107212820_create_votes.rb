class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote
      t.references :votable, polymorphic: true
      t.references :user
      t.timestamps
    end
  end
end
