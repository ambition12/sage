class ApplicationController < ActionController::Base
  $username = 'testuser1'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :trends_update, :status_update
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #strong parametersを設定し、usernameを許可
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  end


  private
  def trends_update
    if MyTrend.find_by(username: $username).nil?
      MyTrend.create(username: $username)
    end
  end

  def status_update
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
    get_article = [genre1, genre2, genre3, genre4, genre5, genre6, genre7, genre8, genre9]

    count = Array.new(9, 0)
    get_article.each.with_index do |genre, i|
      genre.each do |item|
        count[i] = count[i] + item.count
      end
    end

    if Status.find_by(username: username).nil?
      Status.create(username: username, game: count[0], anime: count[1], economy: count[2], entame: count[3], sports: count[4], tech: count[5], life: count[6], tour: count[7], gourmet: count[8])
    else
      status = Status.find_by(username: username)
      status.update(game: count[0], anime: count[1], economy: count[2], entame: count[3], sports: count[4], tech: count[5], life: count[6], tour: count[7], gourmet: count[8])
    end

    max = count.max

    @point = Array.new(count.length, 0)
    count.each_with_index do |count, index|
      if (max != 0)
        @point[index] = 1000 * count / max
      else
        @point[index] = 0
      end
    end
  end

  def after_sign_in_path_for(resource)
    sage_top_path
  end

  private
  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end
end
