class CreateIntroductionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :introduction_comments do |t|
      t.integer :user_id, null: false #ユーザーID(FK)
      t.integer :introduction_id, null: false #紹介ID(FK)
      t.text :commtent, null: false #コメント
      t.timestamps
    end
  end
end
