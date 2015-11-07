class EntameController < ApplicationController
  def entame_view
    # coding:utf-8
    # !/usr/bin/ruby
    require 'json'
    require 'uri'
    require 'net/http'
    @genre = 'entame'
    uri = URI.parse('https://api.apigw.smt.docomo.ne.jp/webCuration/v3/contents?genreId=' + 2.to_s + '&s=1&n=50&APIKEY=427533784e4a4a38696b676a6b79472f516d616866654e6646746536554f383839663754744d496c793736')
    json = Net::HTTP.get(uri)
    entame_results = JSON.parse(json)

    @entame_url = Array.new(entame_results['articleContents'].length + 1, '')
    @entame_title = Array.new(entame_results['articleContents'].length + 1, '')
    for num in 1...entame_results['articleContents'].length
      #				puts results["articleContents"][num]["contentData"]["title"]
      @entame_url[num] = entame_results['articleContents'][num]['contentData']['linkUrl']
      @entame_title[num] = entame_results['articleContents'][num]['contentData']['title']
    end
  end
end
