class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false #ユーザーID(FK)
      t.integer :introduction_id, nul: false  #紹介ID(FK)
      t.timestamps
    end
  end
end
