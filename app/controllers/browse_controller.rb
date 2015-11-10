class BrowseController < ApplicationController
  def input
    username = $username
    url = params[:url]
    genre = params[:genre]

    if Article.find_by(username: username, url: url).nil?
      Article.create(username: username, url: url, genre: genre, count: 1)
    else
      article = Article.find_by(username: username, url: url)
      new_article_count = article.count + 1
      article.update(count: new_article_count)
    end
    redirect_to controller: :mecab, action: :nouncount, url: url
  end

  def output
    username = $username

    genre1 = Article.where(username: username, genre: 'game')
    genre2 = Article.where(username: username, genre: 'anime')
    genre3 = Article.where(username: username, genre: 'economy')
    genre4 = Article.where(username: username, genre: 'entame')
    genre5 = Article.where(username: username, genre: 'sports')
    genre6 = Article.where(username: username, genre: 'tech')
    genre7 = Article.where(username: username, genre: 'life')
    genre8 = Article.where(username: username, genre: 'tour')
    genre9 = Article.where(username: username, genre: 'gourmet')
    @get_article = [genre1, genre2, genre3, genre4, genre5, genre6, genre7, genre8, genre9]

    count = Array.new(9, 0)
    @get_article.each.with_index do |genre, i|
      genre.each do |item|
        count[i] = count[i] + item.count
      end
    end
    if Article.find_by(username: username, url: url).nil?
      Status.create(username: username, game: count[0], anime: count[1], economy: count[2], entame: count[3], sports: count[4], tech: count[5], life: count[6], tour: count[7], gourmet: count[8])
    else
      status = Status.find_by(username: username)
      status.update(game: count[0], anime: count[1], economy: count[2], entame: count[3], sports: count[4], tech: count[5], life: count[6], tour: count[7], gourmet: count[8])
    end

  end
end
