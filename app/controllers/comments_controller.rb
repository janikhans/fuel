class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@spot = Spot.find(params[:spot_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.spot_id = @spot.id

		if @comment.save
			redirect_to spot_path(@spot)
		else
			render 'new'
		end
	end
end
