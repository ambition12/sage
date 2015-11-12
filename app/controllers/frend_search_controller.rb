class FrendSearchController < ApplicationController
  def search_view
  end

  def follow
    your_name = params[:your_name]

    if Friend.find_by(username: current_user.username, friendname: your_name).nil?
      Friend.create(username: current_user.username, friendname: your_name )
    else
      #すでにお友達
    end
    redirect_to action: :search_view
  end

  def search_as_name
    your_name = params[:your_name]

    if User.find_by(username:your_name).nil?
      #ユーザーが存在しない
    else
      @result =  User.find_by(username:your_name)
    end
  end

  def search_as_genre
    genre = params[:genre]

    if Status.where(major: genre).where.not(username: current_user.username).nil?
      #存在しない
    else
      @result = Status.where(major: genre).where.not(username: current_user.username).nil?
    end
  end
end
