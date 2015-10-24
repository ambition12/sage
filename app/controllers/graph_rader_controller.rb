class GraphRaderController < ApplicationController
  def status_view_rader
    genre = ['国内','国際','経済','エンタメ','スポーツ','IT・科学','ライフ','地域','雑誌']
    aData = [7,3,8,5,2,9,5,2,4]

    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart(polar: true,type:'line') #グラフの種類
      f.pane(size:'100%')                  #グラフサイズの比
      f.title(text: 'Status')         #タイトル
      f.xAxis(categories: genre,tickmarkPlacement:'on')
      #categories:各項目の名前,tickmarkPlacement:'on'だとメモリ表示がカテゴリーの表示に沿う
      f.yAxis(gridLineInterpolation: 'polygon',lineWidth:0,min:0,max:10) #各項目の最大値やら
      f.series(name:'ユーザ名',data: aData,pointPlacement:'on')
                                                   #各データ
      f.legend(align: 'right',
	        verticalAlign: 'top',
	        y: 70,
	        layout: 'vertical')
    end
  end
end
