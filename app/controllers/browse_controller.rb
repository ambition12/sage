class BrowseController < ApplicationController
  def input
    url = params[:url]
    genre = params[:genre]

    if Article.find_by(url: url).nil?
      Article.create(url: url, genre: genre, count: 1)
    else
      article = Article.find_by(url: url)
      new_article_count = article.count + 1
      article.update(count: new_article_count)
    end

    @iurl = url
    redirect_to url
  end

  def output
    genre1 = Article.find_all_by_genre('game')
    genre2 = Article.find_all_by_genre('anime')
    genre3 = Article.find_all_by_genre('economy')
    genre4 = Article.find_all_by_genre('entame')
    genre5 = Article.find_all_by_genre('sport')
    genre6 = Article.find_all_by_genre('tech')
    genre7 = Article.find_all_by_genre('life')
    genre8 = Article.find_all_by_genre('tour')
    genre9 = Article.find_all_by_genre('gourmet')
    @get_article = [genre1, genre2, genre3, genre4, genre5, genre6, genre7, genre8, genre9]

    count = Array.new(9, 0)
    @get_article.each.with_index do |genre, i|
      genre.each do |item|
        count[i] = count[i] + item.count
      end
    end
    @pcount = count
  end
end
