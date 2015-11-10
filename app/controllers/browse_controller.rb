class BrowseController < ApplicationController
  def input
    username = current_user.username
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
end
