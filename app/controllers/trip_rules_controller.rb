# encoding: utf-8
class TripRulesController < ApplicationController
  load_and_authorize_resource

  def index
    @trip_rules = TripRule.all
  end

  def new
    @trip_rule = TripRule.new
  end

  def create
    @trip_rule = TripRule.new(params[:trip_rule])

    if @trip_rule.save
      redirect_to trip_rules_path, notice: 'Нове правило створено успішно'
    else
      render atcion: 'new'
    end
  end

  def edit
    @trip_rule = TripRule.find(params[:id])
  end

  def update
    @trip_rule = TripRule.find(params[:id])
    if @trip_rule.update_attributes(params[:trip_rule])
      redirect_to trip_rules_path, notice: 'Правило відредаговано створено успішно'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @trip_rule = TripRule.find(params[:id])
    @trip_rule.destroy
    redirect_to trips_url
  end
end
