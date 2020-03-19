class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # if user_signed_in?
    #   redirect_to flat_path(current_user.flat)
    # end
  end

  def day
    @date = params[:format].to_date
    @events = Event.where('date = ?', "#{params[:format]}")
    @flat = Flat.find(params[:flat_id])
  end
end
