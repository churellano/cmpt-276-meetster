class EventsController < ApplicationController

	before_action :find_event, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
		   @events = Event.all.order("created_at DESC")
		else
		   @category_id = Category.find_by(name: params[:category]).id
		   @events = Event.where(:category_id => @category_id).order("created_at DESC")
		end

		if params[:search]
			@search_term = params[:search]
			@events = @events.search_by(@search_term)
		end
	end

	def show
	end

	def new
		@event = current_user.events.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@event = current_user.events.build(event_params)
		@event.category_id = params[:category_id]

		if @event.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@event.category_id = params[:category_id]
		if @event.update(event_params)
			redirect_to event_path(@event)
		else
			render 'edit'
		end
	end

	def destroy
			@event.destroy
		    redirect_to root_path
	end

    private

    def event_params
    	params.require(:event).permit(:title, :description, :location, :amount, :category_id, :event_img)
    end

    def find_event
    	@event = Event.find(params[:id])
    end




end
