class RecordingController < ApplicationController
    	before_action :authenticate_user!
	def create
		@location = Location.find(params[:location_id])
		@recording = @location.comments.create(recording_param)
		@recording.user_id = current_user.id if current_user
		@recording.save

		redirect_to location_path(@location)
	end

	def update
		@location = Location.find(params[:id])

    	if @location.update(location_params)
      		redirect_to @recording
    	else
      		render 'edit'
    	end
  	end


	private
	def recording_param
		params.require(:comment).permit(:temp, :status, :user_id)
	end
end
