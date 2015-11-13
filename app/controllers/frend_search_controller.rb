class FrendSearchController < ApplicationController
  def search_view
    @result = nil
    if !params[:search_button].nil?
      typed_name = params[:typed_name]
      checked_genre = params[:genre]

      if (typed_name != "" && !checked_genre.nil?)
        @result = search_as_name_genre(typed_name, checked_genre)
      else
        if (typed_name != "")
          @result = search_as_name(typed_name)
        end

        if (!checked_genre.nil?)
          @result = search_as_genre(checked_genre)
        end
      end
    end
  end

  def follow
    your_name = params[:your_name]

    if Friend.find_by(username: current_user.username, friendname: your_name).nil?
      Friend.create(username: current_user.username, friendname: your_name)
    else
      #すでにお友達
    end
    redirect_to :back
  end

  private
  def search_as_name your_name
    if !User.where(username: your_name).where.not(username: current_user.username).exists?
      return nil
    else
      return User.where(username: your_name).where.not(username: current_user.username)
    end
  end

  private
  def search_as_genre genre
    if !Status.where(major: genre).where.not(username: current_user.username).exists?
      return nil
    else
      return Status.where(major: genre).where.not(username: current_user.username)
    end
  end

  private
  def search_as_name_genre your_name, genre
    name_scope = Status.where(username: your_name)
    name_where = name_scope.where_values.reduce(:and)
    name_bind = name_scope.bind_values

    genre_scope = Status.where(major: genre)
    genre_where = genre_scope.where_values.reduce(:and)
    genre_bind = genre_scope.bind_values

    if !Status.where(name_where.or genre_where).tap { |sc| sc.bind_values = name_bind + genre_bind }.where.not(username: current_user.username).exists?
      return nil
    else
      Status.where(name_where.or genre_where).tap { |sc| sc.bind_values = name_bind + genre_bind }.where.not(username: current_user.username)
    end
  end
end
