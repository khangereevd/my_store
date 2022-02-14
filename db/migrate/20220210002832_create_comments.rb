class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      # t.integer :commentable_id #
      # t.string :commentable_type # Item, BlogPost
      t.references :commentable, polymorphic: true
      t.timestamps
    end
  end
end
