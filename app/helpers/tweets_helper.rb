module TweetsHelper
  def tweet_lists(tweets)
    html = ''
    tweets.each do |tweet|
      html += render(partial: 'tweet', locals: { tweet:tweet })
    end
    # raw(html)のraw()は、HTMLを正常に表示するためのメソッドと覚えていただいて問題ありません
    return raw(html)
  end
end
