class MecabController < ApplicationController
  def nouncount
    require 'nokogiri'
    require 'open-uri'
    require 'natto'

    url = params[:url]
    user_dic = 'assets/neologd'
    nm = Natto::MeCab.new("-u #{user_dic}")

    wordHash = {}

    doc = Nokogiri::HTML(open(url), &:noblanks)

    doc.search('script').each do |script|
      script.content = '' # #scriptタグの中身を空にする
    end

    doc.css('body').each do |elm|
      text = elm.content.gsub(/(\t|\s|\n|\r|\f|\v)/, '')
      nm.parse(text) do |n|
        wordHash[n.surface] ? wordHash[n.surface] += 1 : wordHash[n.surface] = 1 if n.feature.match('名詞')
      end
    end

    wordHash.each do |key, value|
      if Trend.find_by(noun: key).nil?
        Trend.create(noun: key, count: value)
      else
        trend = Trend.find_by(noun: key)
        new_count = trend.count + value
        trend.update(count: new_count)
      end
    end
    redirect_to url
  end

  def output
    trends_desc = Trend.order(:count).reverse_order.limit(5)
    @mytrends = Array.new(5, 'null')
    trends_desc.each_with_index do |item, index|
      @mytrends[index] = item.noun
    end
    redirect_to controller: :sage, action: :keyword_update, trends1: @mytrends[0], trends2: @mytrends[1], trends3: @mytrends[2], trends4: @mytrends[3], trends5: @mytrends[4]
  end
end
