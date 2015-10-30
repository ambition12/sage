class AnimeController < ApplicationController
  def anime_view
    # coding:utf-8
    # !/usr/bin/ruby
    require 'json'
    require 'uri'
    require 'net/http'
    @genre1 = 'anime'
    uri = URI.parse('https://api.apigw.smt.docomo.ne.jp/webCuration/v3/contents?genreId=' + 14.to_s + '&s=1&n=50&APIKEY=427533784e4a4a38696b676a6b79472f516d616866654e6646746536554f383839663754744d496c793736')
    json = Net::HTTP.get(uri)
    anime_results = JSON.parse(json)

    @anime_url = Array.new(anime_results['articleContents'].length + 1, '')
    for num in 1...anime_results['articleContents'].length
      @anime_url[num] = anime_results['articleContents'][num]['contentData']['linkUrl']
    end
  end
end
