class TripDatesController < ApplicationController
  load_and_authorize_resource

  def new
    @trip = current_trip
    @trip_date = @trip.trip_dates.build
  end

  def create
    if current_trip.trip_dates.create(params[:trip_date])
      redirect_to edit_trip_path(current_trip), notice: t(:success_to_create, scope: :trip_date)
    else
      render action: :new, errors: t(:failed_to_create, scope: :trip_date)
    end
  end

  def edit
    @trip = current_trip
    @trip_date = TripDate.find(params[:id])
  end

  def update
    trip_date = current_trip.trip_dates.find(params[:id])
    if trip_date.update_attributes(params[:trip_date])
      redirect_to edit_trip_path(current_trip), notice: t(:success_to_save, scope: :trip_date)
    else
      render action: :edit, errors: t(:failed_to_save, scope: :trip_date)
    end
  end

  def destroy
    trip_date = current_trip.trip_dates.find(params[:id])
    if trip_date.destroy
      redirect_to edit_trip_path(current_trip), notice: t(:successfully_deleted, scope: :trip_date)
    else
      redirect_to :back, errors: t(:failed_delete, scope: :trip_date)
    end
  end

  private
  def current_trip
    Trip.find(params[:trip_id])
  end
end
