class ParticipationsController < ApplicationController
  def create
    @participation = Participation.new()
    @event = Event.find(params[:event_id])
    @flat_user = current_user.flat_user
    @participation.event = @event
    @participation.flat_user = @flat_user
    if @participation.save
      redirect_to event_path(@event), notice: 'Participation enregistrée'
    else
      render 'events/show'
    end
  end

  def destroy
    @participation = Participation.find(params[:id])
    @event = @participation.event
    @participation.destroy
    render 'events/show'
  end

  private

  def participation_params
    params.require('participation')
  end
end
