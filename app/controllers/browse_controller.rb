class BrowseController < ApplicationController
  def input
    url = http~
      if Trend.find_by(:url => url) == nil
        @article = Article.create(url: url, genre:test, count: 1)
      else
        @article = Article.find_by(:url => url)
        @carrent_article_count = @article.count
        @new_article_count = @article.count + 1
        @article.update(count: @new_article_count)
      end
  end
end
