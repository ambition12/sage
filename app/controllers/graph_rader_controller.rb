class GraphRaderController < ApplicationController
  def status_view_rader
    genre = ['ゲーム', 'アニメ', '政治・経済', 'エンタメ', 'スポーツ', 'IT・科学', 'ライフ', '旅行', 'グルメ']

    status = Status.find_by(username: current_user.username)
    statuses = [status.game,status.anime,status.economy,status.entame,status.sports,status.tech,status.life,status.tour,status.gourmet]

    aData = Array.new(statuses.length, 0)

    max = statuses.max

    statuses.each_with_index do |count, index|
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
      f.series(name: 'ジャンル', data: aData, pointPlacement: 'on')
      # 各データ
      f.legend(align: 'right',
               verticalAlign: 'top',
               y: 70,
               layout: 'vertical')
    end
  end
end
