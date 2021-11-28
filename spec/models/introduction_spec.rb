require 'rails_helper'

context 'Introductionモデルのテスト' do
  it '有効な投稿内容の場合は保存されるか' do
    introduction = FactoryBot.build(:introduction)
    expect(introduction).to be_valid
  end

  it '場所がない場合、無効である' do
    introduction = FactoryBot.build(:introduction, place: nil)
    introduction.valid?
    expect(introduction.errors[:place]).to include("can't be blank")
  end

  it '作者名がない場合、無効である' do
    introduction = FactoryBot.build(:introduction, author: nil)
    introduction.valid?
    expect(introduction.errors[:author]).to include("can't be blank")
  end

   it '都道府県名がない場合、無効である' do
    introduction = FactoryBot.build(:introduction, address_prefecture: nil)
    introduction.valid?
    expect(introduction.errors[:address_prefecture]).to include("can't be blank")
  end

  it '都道府県以降の住所がない場合、無効である' do
    introduction = FactoryBot.build(:introduction, address_after_prefecture: nil)
    introduction.valid?
    expect(introduction.errors[:address_after_prefecture]).to include("can't be blank")
  end

end
