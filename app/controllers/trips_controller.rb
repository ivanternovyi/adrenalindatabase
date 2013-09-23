class TripsController < ApplicationController
  load_and_authorize_resource

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      redirect_to(trips_path)
    else
      render action: :new, errors: t(:failed_create, scope: :trip)
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    if @trip.update_attributes(params[:trip])
      redirect_to trips_path, notice: t(:successfully_updated, scope: :trip)
    else
      render action: :edit, errors: t(:failed_update, scope: :trip)
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    if @trip.destroy
      redirect_to trips_path, notice: t(:successfully_deleted, scope: :trip)
    else
      redirect_to trips_path, errors: t(:failed_delete, scope: :trip)
    end
  end
end
