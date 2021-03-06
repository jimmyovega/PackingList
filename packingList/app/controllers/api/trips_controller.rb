module Api
	class TripsController < ApplicationController
		def index
			trips = Trip.all
			render json: trips
		end

		def show
			trip = Trip.find(params[:id])
			render json: trip.to_json( include:{
				default_items: {only: [:item]}
				})
		end

		def new 
    @trip = Trip.new
  	end

	  def create
	    @trip = Trip.new
	    @trip.user_id = current_user.id
	    @trip.destination = params[:destination]
	    @trip.start_date = params[:start_date]
	    @trip.end_date = params[:end_date]
	    @trip.id = params[:id]

	    if @trip.save
	      redirect_to(@trip)
	    else 
	      render :new
	    end
	  end

	end
end