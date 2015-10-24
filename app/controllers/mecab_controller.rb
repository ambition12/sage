class MecabController < ApplicationController
  def nouncount

    require 'nokogiri'
    require 'open-uri'
    require 'natto'

    nm = Natto::MeCab.new
    @wordHash = {}

    doc = Nokogiri::HTML(open('http://railstutorial.jp/')) do |config|
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
    # p @wordHash
  end
end
