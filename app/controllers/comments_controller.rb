class CommentsController < ApplicationController
	before_action :find_event
	before_action :find_comment, only: [:edit, :update, :destroy]
	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.event_id = @event.id
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to event_path(@event)
		else 
			render'new'
		end
	end

	def edit
		
	end

	def update
		if@comment.update(comment_params)
			redirect_to event_path(@event)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to event_path(@event)
	end

	private

	   def comment_params
	   	params.require(:comment).permit(:reply)
	   end

	   def find_event
	   	  @event = Event.find(params[:event_id])
	   end

	   def find_comment
	   	@comment = Comment.find(params[:id])
	   end
end
