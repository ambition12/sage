class TourController < ApplicationController
  def tour_view
    # coding:utf-8
    # !/usr/bin/ruby
    require 'json'
    require 'uri'
    require 'net/http'
    @genre = 'tour'
    uri = URI.parse('https://api.apigw.smt.docomo.ne.jp/webCuration/v3/contents?genreId=' + 12.to_s + '&s=1&n=50&APIKEY=427533784e4a4a38696b676a6b79472f516d616866654e6646746536554f383839663754744d496c793736')
    json = Net::HTTP.get(uri)
    tour_results = JSON.parse(json)

    @tour_url = Array.new(tour_results['articleContents'].length + 1, '')
    @tour_title = Array.new(tour_results['articleContents'].length + 1, '')
    for num in 1...tour_results['articleContents'].length
      #				puts results["articleContents"][num]["contentData"]["title"]
      @tour_url[num] = tour_results['articleContents'][num]['contentData']['linkUrl']
      @tour_title[num] = tour_results['articleContents'][num]['contentData']['title']
    end
  end
end
