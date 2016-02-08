class AddPolymorphicAssociation < ActiveRecord::Migration
  def change
    remove_column :user_votes, :post_id

    add_column :user_votes, :votable_id, :integer, null: false
    add_column :user_votes, :votable_type, :string, null: false

    add_index :user_votes, [:votable_id, :votable_type]
    add_index :user_votes, [:user_id, :votable_id, :votable_type], unique: true
  end
end
