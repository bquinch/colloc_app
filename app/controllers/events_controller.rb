class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @participation = Participation.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @flat_user = current_user.flat_user
    @event.flat_user = @flat_user
    @participation = Participation.new(flat_user: @flat_user, event: @event)
    if @event.save
      @participation.save
      redirect_to event_path(@event)
    else
      render :new, alert: 'Mauvaises informations'
    end
  end

  private

  def event_params
    params.require('event').permit(
      :description,
      :title,
      :address,
      :date,
      :time
    )
  end
end
