require 'rails_helper'

context 'Userモデルのテスト' do
  it '有効な投稿内容の場合は保存されるか' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it '姓がない場合、無効である' do
    user = FactoryBot.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it '名がない場合、無効である' do
    user = FactoryBot.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it 'メールアドレスがない場合、無効である' do
    user = FactoryBot.build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  it 'メールアドレスがない場合、無効である' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "パスワードがない場合、無効である" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end
