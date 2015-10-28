class SportsController < ApplicationController
  def sports_view
    # coding:utf-8
    # !/usr/bin/ruby
    require 'json'
    require 'uri'
    require 'net/http'
    @sports = 'sports'
    uri = URI.parse('https://api.apigw.smt.docomo.ne.jp/webCuration/v3/contents?genreId=' + 3.to_s + '&s=1&n=50&APIKEY=427533784e4a4a38696b676a6b79472f516d616866654e6646746536554f383839663754744d496c793736')
    json = Net::HTTP.get(uri)
    @sports_results = JSON.parse(json)
    for num in 1...@sports_results['articleContents'].length
      #				puts results["articleContents"][num]["contentData"]["title"]
      @sports_results['articleContents'][num]['contentData']['linkUrl']
    end
  end
end
