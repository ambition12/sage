class MecabController < ApplicationController
  def nouncount
    require 'nokogiri'
    require 'open-uri'
    require 'natto'

    url = params[:url]
    # nm = Natto::MeCab.new
    user_dic = './app/assets/neologd.dic'
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

    username = current_user.username

    wordHash.each do |key, value|
      if Trend.find_by(username: username, noun: key).nil?
        Trend.create(username: username, noun: key, count: value)
      else
        trend = Trend.find_by(username: username, noun: key)
        new_count = trend.count + value
        trend.update(count: new_count)
      end
    end

    if MyTrend.find_by(username: username).nil?
      MyTrend.create(username: username)
      mytrends = MyTrend.find_by(username: username)
    else
      mytrends = MyTrend.find_by(username: username)
    end


    if Trend.where.not(noun: %w(padding px margin A B C D E F G H I J K L M N O P Q R S T U V W X X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z)).order(:count).reverse_order.limit(5).where(username: username).exists?
      trends_desc = Trend.where.not(noun: %w(padding px margin A B C D E F G H I J K L M N O P Q R S T U V W X X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z)).order(:count).reverse_order.limit(5).where(username: username)
      mytrends.update(one: trends_desc[0].noun, two: trends_desc[1].noun, three: trends_desc[2].noun, four: trends_desc[3].noun, five: trends_desc[4].noun)
    end
    redirect_to url
  end
end