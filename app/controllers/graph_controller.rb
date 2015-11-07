class GraphController < ApplicationController
  def status_view
    current_quantity = [1000, 5000, 3000, 8000]
    days = [1, 3, 5, 7]
    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: '月日を入れてくれ')
      f.xAxis(categories: days, title: { text: '日付' })
      f.series(name: '日にち', data: current_quantity)
      f.chart(type: 'column')

      days = [1, 3, 5, 7]
      current_quantity = [1000, 5000, 3000, 8000]
    end
  end
end
