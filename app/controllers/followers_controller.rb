class FollowersController < ApplicationController
	def create
		@follower = Follower.new(follower_params)
		if @follower.save
			Notifications.followed(@follower).deliver
			redirect_to users_path
		else
			redirect_to users_path
		end
	end

	def destroy
		@follower = Follower.find(params[:id])
		@follower.destroy
		redirect_to users_path
	end

	def follower_params
		params.require(:follower).permit(:follower_id, :followee_id)
	end
end
