Rails.application.routes.draw do
  # devise作成時に自動生成、ユーザー機能に必要なルーティングを一気に生成してくれる
  devise_for :users
  #http://localhost:3000へアクセスしてもツイートトップページが表示されるようにする
  root to: 'tweets#index'

  
  resources :tweets do
    resources :comments, only: :create
    # tweetsのルーティングにsearchアクションのルーティングを追加
    # 全てのデータに適応させたいからcollectionを使う
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
