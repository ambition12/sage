class EconomyController < ApplicationController
  def economy_view
    # coding:utf-8
    # !/usr/bin/ruby
    require 'json'
    require 'uri'
    require 'net/http'
    @genre = 'economy'
    uri = URI.parse('https://api.apigw.smt.docomo.ne.jp/webCuration/v3/contents?genreId=' + 1.to_s + '&s=1&n=50&APIKEY=427533784e4a4a38696b676a6b79472f516d616866654e6646746536554f383839663754744d496c793736')
    json = Net::HTTP.get(uri)
    economy_results = JSON.parse(json)

    @economy_url = Array.new(economy_results['articleContents'].length + 1, '')
    @economy_title = Array.new(economy_results['articleContents'].length + 1, '')
    for num in 1...economy_results['articleContents'].length
      @economy_url[num] = economy_results['articleContents'][num]['contentData']['linkUrl']
      @economy_title[num] = economy_results['articleContents'][num]['contentData']['title']
    end
  end
end
