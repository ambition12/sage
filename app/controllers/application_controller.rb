class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :status_update

  private

  def status_update
    genre1 = Article.find_all_by_genre('game')
    genre2 = Article.find_all_by_genre('anime')
    genre3 = Article.find_all_by_genre('economy')
    genre4 = Article.find_all_by_genre('entame')
    genre5 = Article.find_all_by_genre('sports')
    genre6 = Article.find_all_by_genre('tech')
    genre7 = Article.find_all_by_genre('life')
    genre8 = Article.find_all_by_genre('tour')
    genre9 = Article.find_all_by_genre('gourmet')
    get_article = [genre1, genre2, genre3, genre4, genre5, genre6, genre7, genre8, genre9]

    count = Array.new(9, 0)
    get_article.each.with_index do |genre, i|
      genre.each do |item|
        count[i] = count[i] + item.count
      end
    end

    @point = Array.new(count.length, 0)

    max = count.max

    count.each_with_index do|count, index|
      @point[index] = 1000 * count / max
    end
  end
end
