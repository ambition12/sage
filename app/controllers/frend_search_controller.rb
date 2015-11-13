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

  def your_status
    your_name = params[:your_name]
    genre = ['ゲーム', 'アニメ', '政治・経済', 'エンタメ', 'スポーツ', 'IT・科学', 'ライフ', '旅行', 'グルメ']

    if Status.find_by(username: your_name).nil?
      your_status = Array.new(9, 0)
    else
      your_status_tmp = Status.find_by(username: your_name)
      your_status = Array.new(9, 0)
      your_status[0] = your_status_tmp.game
      your_status[1] = your_status_tmp.anime
      your_status[2] = your_status_tmp.economy
      your_status[3] = your_status_tmp.entame
      your_status[4] = your_status_tmp.sports
      your_status[5] = your_status_tmp.tech
      your_status[6] = your_status_tmp.life
      your_status[7] = your_status_tmp.tour
      your_status[8] = your_status_tmp.gourmet

      if MyTrend.find_by(username: your_name).nil?
        @your_trend = Array.new(5, "google")
      else
        your_trend_tmp = MyTrend.find_by(username: your_name)
        @your_trend = Array.new(5, "google")
        @your_trend[0] = your_trend_tmp.one
        @your_trend[1] = your_trend_tmp.two
        @your_trend[2] = your_trend_tmp.three
        @your_trend[3] = your_trend_tmp.four
        @your_trend[4] = your_trend_tmp.five
      end

    end

    aData = Array.new(your_status.length, 0)

    max = your_status.max

    your_status.each_with_index do |count, index|
      if (max != 0)
        aData[index] = 1000 * count / max
      else
        aData[index] = 0
      end
    end

    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart(polar: true, type: 'line') # グラフの種類
      f.pane(size: '100%') # グラフサイズの比
      f.title(text: 'Status') # タイトル
      f.xAxis(categories: genre, tickmarkPlacement: 'on')
      # categories:各項目の名前,tickmarkPlacement:'on'だとメモリ表示がカテゴリーの表示に沿う
      f.yAxis(gridLineInterpolation: 'polygon', lineWidth: 0, min: 0, max: 1000) # 各項目の最大値やら
      f.series(name: 'ジャンル', data: @aData, pointPlacement: 'on')
      # 各データ
      f.legend(align: 'right',
               verticalAlign: 'top',
               y: 70,
               layout: 'vertical')
    end
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
