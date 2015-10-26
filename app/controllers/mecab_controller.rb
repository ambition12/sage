class MecabController < ApplicationController
  def nouncount

    require 'nokogiri'
    require 'open-uri'
    require 'natto'

    nm = Natto::MeCab.new("-d /usr/local/lib/mecab/dic/mecab-ipadic-neologd")
    @wordHash = {}

    doc = Nokogiri::HTML(open('http://www.gochiusa.com/news/hp0001/index.html')) do |config|
      config.noblanks
    end

    doc.search("script").each do |script|
      script.content = "" ##scriptタグの中身を空にする
    end

    doc.css('body').each do |elm|
      text = elm.content.gsub(/(\t|\s|\n|\r|\f|\v)/, "")
      nm.parse(text) do |n|
        @wordHash[n.surface] ? @wordHash[n.surface] += 1 : @wordHash[n.surface] = 1 if n.feature.match("名詞")
      end
    end

    
  end
end
