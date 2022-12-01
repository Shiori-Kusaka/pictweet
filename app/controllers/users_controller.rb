class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    # 詳細ページを表示する上で必要な情報は@nicknameと@tweets情報
    # インスタンス変数にするのは、ビューファイルで表示しなければいけないから
    @nickname = user.nickname
    @tweets = user.tweets
  end
end
