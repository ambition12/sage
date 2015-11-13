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
end
