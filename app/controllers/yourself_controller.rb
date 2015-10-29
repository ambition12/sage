class YourselfController < ApplicationController
	def show
	    render :text => "id = #{params[:id]}"
	end
end
