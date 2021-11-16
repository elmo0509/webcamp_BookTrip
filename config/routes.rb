Rails.application.routes.draw do
  #管理者側はログイン機能のみ
  #登録、変更は行わない
  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
