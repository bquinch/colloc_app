class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    redirect_to flat_path(current_user.flat) if @user != current_user
  end
end
