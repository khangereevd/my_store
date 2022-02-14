class ChangeDescriptionFromItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :description, :text
  end

  def down
    change_column :items, :description, :string
  end
end
