class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@spots = @user.spots.order("created_at DESC")
		@profile_message = true
	end
end
