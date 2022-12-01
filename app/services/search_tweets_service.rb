class SearchTweetsService
  def self.search(search)
    if search != ""
      # プレースホルダー ? をいれることによって、ユーザーの入力を適用する前にSQL文を確定します。[]はプレースホルダーを利用するために用いています。
      search = "%#{search}%"
    Tweet.find_by_sql(["select * from tweets where text like ? ", search])
      # Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
