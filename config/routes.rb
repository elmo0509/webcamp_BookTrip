Rails.application.routes.draw do
  #管理者側はログイン機能のみ
  #登録、変更は行わない
  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  devise_for :users
  
  root to: "homes#top"
  get "about" => "homes#about"
  resources :introductions  do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only:[:create, :destroy]
  end
  resource "users", only: [:show, :edit, :update, :index]
  get "users/unsubscribe" => "users#unsubscribe"
  patch "users/withdraw" => "users#withdraw"
  
  namespace :admin do
    root to: "homes#top"  #投稿記事一覧
    resources :users, only: [:index, :show, :edit, :update]
    resources :introductions, only: [:show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
