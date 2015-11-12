class GraphController < ApplicationController
  def status_view
    @end_at = Date.today
    @start_at = @end_at - 3
    genres = ["game", "anime", "economy", "entame", "sports", "tech", "life", "tour", "gourmet"]

    articles = Array.new(genres.length).map { Array.new(4) }

    column = 0
    while column < 4 do
      row = 0
      while row < genres.length do
        articles[row][column] = Article.where(username: current_user.username).where("updated_at like '%" + (@end_at - column).strftime("%Y-%m-%d") + "%'").where(genre: genres[row])
        row = row + 1
      end
      column = column + 1
    end

    counts = Array.new(genres.length) { Array.new(4, 0) }

    column = 0
    while column < 4 do
      row = 0
      while row < genres.length do
        if !(articles[row][3 - column]).nil?
          articles[row][3 - column].each do |article|
            counts[row][column] = counts[row][column] + article.count
          end
        end
        row = row + 1
      end
      column = column + 1
    end

    @categories = @start_at.upto(@end_at).to_a

    @bar = LazyHighCharts::HighChart.new('column') do |f|
      genres.each_with_index do |genre, index|
        f.series(:name => genre, :data => counts[index])
      end
      f.xAxis(:categories => @categories)
      f.title({:text => "Stacked Columns"})

      ## or options for column
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column => {:stacking => "normal"}})
    end
  end
end

