# -*- coding: utf-8 -*-
class SageController < ApplicationController
	#記事のグローバル配列(更新する際に配列の中身を変更し、リダイレクトする)
	$default_url = "http://www.google.com"
	$url = ["http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com"]
	#$keyword(トレンド記事を検索するキーワード)
	APIKEY = 'Av6GLD1hPwWcFziuhtlLqp6yCBXiZYGKJ8SXHox80dY'
	$keyword = ['人工知能','Rails','WBS','twitter','マイナンバー']

	#
	def yourself		
	end
	#記事更新用のaction
	def yourself_update
		bing = Bing.new(APIKEY, 10, 'News')

		pid = params[:id].to_i 
		if pid <= $keyword.length then
			results = bing.search($keyword[pid - 1])
			for num in 0...6 do
				articleUrl = results[0][:News][num][:Url]		
				if articleUrl != nil then
					$url[num] = articleUrl
				end
			end
		else
			for num in 0...6 do
				$url[num] = $default_url 
			end
		end

		redirect_to :action => "yourself"

		#====

		#bing = Bing.new(APIKEY, 10, 'News')

		#case params[:id].to_i
		#when 1 then
		#	results = bing.search($keyword[0])

		#when 2 then
		#	results = bing.search($keyword[1])

		#when 3 then
		#	results = bing.search($keyword[2])

		#when 4 then
		#	results = bing.search($keyword[3])

		#when 5 then
		#	results = bing.search($keyword[4])

		#else
		#	return
		#end

		#for num in 0...6 do
		#	$url[num] = results[0][:News][num][:Url]		
		#end

		#redirect_to :action => "yourself"
	end
end
