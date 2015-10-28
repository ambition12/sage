class BrowseController < ApplicationController
  def input
    url = "test8"
    genre = "genre1"
    if Article.find_by(:url => url) == nil
      @article = Article.create(url: url, genre: genre, count: 1)
    else
      @article = Article.find_by(:url => url)
      @carrent_article_count = @article.count
      @new_article_count = @article.count + 1
      @article.update(count: @new_article_count)
    end
  end

  def output
    genre1 = Article.find_all_by_genre("genre1")
    genre2 = Article.find_all_by_genre("genre2")
    genre3 = Article.find_all_by_genre("genre3")
    genre4 = Article.find_all_by_genre("genre4")
    genre5 = Article.find_all_by_genre("genre5")
    genre6 = Article.find_all_by_genre("genre6")
    @get_article = [genre1, genre2, genre3, genre4, genre5, genre6]

    count = Array.new(6, 0)
    @get_article.each.with_index do |genre, i|
        genre.each do |item|
          count[i] = count[i] + item.count
        end
    end
    @pcount = count
  end
end
