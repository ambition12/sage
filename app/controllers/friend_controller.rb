class FriendController < ApplicationController
  def show
    if Friend.find_by(username: current_user.username).nil?
      @my_friends = nil
    else
      @my_friends = Friend.where(username: current_user.username)
    end
  end

  def your_status
    your_name = params[:your_name]

    if Status.find_by(username: your_name).nil?
      @your_status = Array.new(9, 0)
      @your_trend = Array.new(5, "google")
    else
      your_status_tmp = Status.find_by(username: your_name)
      @your_status = Array.new(9,0)
      @your_status[0] = your_status_tmp.game
      @your_status[1] = your_status_tmp.anime
      @your_status[2] = your_status_tmp.economy
      @your_status[3] = your_status_tmp.entame
      @your_status[4] = your_status_tmp.sports
      @your_status[5] = your_status_tmp.tech
      @your_status[6] = your_status_tmp.life
      @your_status[7] = your_status_tmp.tour
      @your_status[8] = your_status_tmp.gourmet

      your_trend_tmp = MyTrend.find_by(username: your_name)
      @your_trend = Array.new(5,"google")
      @your_trend[0] = your_trend_tmp.one
      @your_trend[1] = your_trend_tmp.two
      @your_trend[2] = your_trend_tmp.three
      @your_trend[3] = your_trend_tmp.four
      @your_trend[4] = your_trend_tmp.five
    end
    # redirect_to action: :show, url: url
  end

  def follow
    your_name = params[:your_name]

    if Friend.find_by(username: current_user.username, friendname: your_name).nil?
      Friend.create(username: current_user.username, friendname: your_name )
    else
      #すでにお友達
    end
  end

  def remove
    your_name = params[:your_name]

    if Friend.find_by(username: current_user.username, friendname: your_name).nil?
      #すでにお友達でない
    else
      friend = Friend.find_by(username: current_user.username, friendname: your_name)
      friend.destroy
    end
    redirect_to action: :show
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
