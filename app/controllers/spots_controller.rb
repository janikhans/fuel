class SpotsController < ApplicationController

	before_action :find_spot, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]


	def index
		@spots = Spot.all.order("created_at DESC")
		@welcome_message = true
	end

	def show
		@comments = Comment.where(spot_id: @spot)
		@spot_profile = true
	end

	def new
		@spot = current_user.spots.build
	end

	def create
		@spot = current_user.spots.build(spot_params)

		if @spot.save
			redirect_to @spot, notice: "Succesfully added a new Spot!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @spot.update(spot_params)
			redirect_to @spot, notice: "Spot was Succesfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@spot.destroy
		redirect_to root_path
	end

	def upvote
		@spot.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@spot.downvote_from current_user
		redirect_to :back
	end

	private

	def find_spot
		@spot = Spot.find(params[:id])
	end

	def spot_params
		params.require(:spot).permit(:vehicle, :description, :image)
	end
end
