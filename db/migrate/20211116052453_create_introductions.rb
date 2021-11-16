class CreateIntroductions < ActiveRecord::Migration[5.2]
  def change
    create_table :introductions do |t|
      t.integer :user_id, null: false #ユーザーID(FK)
      t.string :place, null: false  #スポット名
      t.string :image_id  #紹介写真
      t.string :author, null: false #作者名
      t.string :title  #作品名
      t.integer :address_prefecture, null: false, default: 0 #住所(都道府県),enum使用
      t.string :address_after_prefecture, null: false #住所(都道府県以降)
      t.string :address_building_name #住所(建物名)
      t.text :introduction, null: false #紹介文
      t.boolean :is_closed, null: false, default: false #非公開設定
      t.boolean :admin_is_closed, null: false, default: false #管理者用の非公開設定
      t.timestamps
    end
  end
end
