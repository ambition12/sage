class SageController < ApplicationController
	#記事のグローバル配列(更新する際に配列の中身を変更し、リダイレクトする)
	$url = ["http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com"]
	def yourself
	end
	#記事更新用のaction
	def yourself_update
#		render :text => "id=#{$url[params[:id].to_i]}"
		case params[:id].to_i
			when 1 then
				$url = ["http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com"]
			when 2 then
				$url = ["http://www.yahoo.co.jp","http://www.yahoo.co.jp","http://www.yahoo.co.jp","http://www.yahoo.co.jp","http://www.yahoo.co.jp","http://www.yahoo.co.jp"]
		        when 3 then
				$url = ["http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com"]
			when 4 then
				$url = ["http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com"]
			when 5 then
				$url = ["http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com"]
			else
				$url = ["http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com","http://www.google.com"]
		end
		redirect_to :action => "yourself"	
	end
end
