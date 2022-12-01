class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def search
    @tweets = SearchTweetsService.search(params[:keyword])
  end


  def index
    # Userモデルの情報をまとめて取得,レコードを降順に並び替える
    @tweets = Tweet.includes(:user).order("created_at DESC")
    query = "SELECT * FROM tweets"
    @tweets = Tweet.find_by_sql(query)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end
  
  # ビューファイルへツイート情報を受け渡す必要がないため、インスタンス変数は使用しない
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  # ビューファイルへツイート情報を受け渡す必要がないため、インスタンス変数は使用しない
  def update
    tweet = Tweet.find(params[:id])
    #ストロングメソッドを使って編集するキーを限定する
    tweet.update(tweet_params)
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end


  private
  def tweet_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index 
    unless user_signed_in?
      redirect_to action: :index;
    end
  end


end
