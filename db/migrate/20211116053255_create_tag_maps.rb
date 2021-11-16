class CreateTagMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_maps do |t|
      t.integer :introduction_id, null: false #紹介ID(FK)
      t.integer :tag_id, null: false  #タグID(FK)
      t.timestamps
    end
  end
end
