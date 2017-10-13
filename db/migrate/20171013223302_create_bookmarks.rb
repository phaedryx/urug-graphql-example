class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :link_id
      t.string :description

      t.timestamps
    end
  end
end
