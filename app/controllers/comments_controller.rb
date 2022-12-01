class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    # コメント完了後の処理,コメントしたツイートの詳細画面へリダイレクト
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private
  def comment_params
    # commentテーブルのテキストとカレントユーザー、ツイートIDを結び付ける
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
