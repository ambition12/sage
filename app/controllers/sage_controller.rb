# -*- coding: utf-8 -*-
class SageController < ApplicationController
  #記事のグローバル配列(更新する際に配列の中身を変更し、リダイレクトする)
  $default_url = "http://www.google.com"
  $default_title = "nil"
  $url = Array.new(6, "http://www.google.com")
  $title = Array.new(6, "nil")
  #$keyword(トレンド記事を検索するキーワード)
  APIKEY = 'Av6GLD1hPwWcFziuhtlLqp6yCBXiZYGKJ8SXHox80dY'

  def yourself
  end

  #記事更新用のaction
  def yourself_update
    bing = Bing.new(APIKEY, 10, 'News')

    pid = params[:id].to_i
    if !(Trend.find_by(username: current_user.username).nil?)
      results = bing.search($keyword[pid - 1])
      if (results[0][:News][0] != nil)
        for num in 0...6 do
          articleUrl = results[0][:News][num][:Url]
          articleTitle = results[0][:News][num][:Title]
          if articleUrl != nil then
            $url[num] = articleUrl
            $title[num] = articleTitle
          end
        end
      else
        for num in 0...6 do
          $url[num] = $default_url
          $title[num] = $default_title
        end
      end
    else
      $keyword = Array.new(5, "google")
    end
    redirect_to :action => "yourself"
  end

  def keyword_update
    mytrends = MyTrend.find_by(username: current_user.username)
    keyword_tmp = Array.new(5, "null")
    keyword_tmp[0] = mytrends.one
    keyword_tmp[1] = mytrends.two
    keyword_tmp[2] = mytrends.three
    keyword_tmp[3] = mytrends.four
    keyword_tmp[4] = mytrends.five

    $keyword = keyword_tmp
    redirect_to action: "yourself_update", id: 1
  end
end
