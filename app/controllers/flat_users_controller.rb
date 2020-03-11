class FlatUsersController < ApplicationController
  def new
    @flat_user = FlatUser.new
  end

  def create
    @flat_user = FlatUser.new(flat_user_params)
    @flat = Flat.find_by(flat_code: @flat_user.flat_code)
    @flat_user.flat = @flat
    if @flat
      @flat_user.user = current_user
      @flat_user.save
      redirect_to flat_path(@flat), notice: "Vous avez bien été ajouté à cet appartement"
    else
      render :new, alert: 'Code invalide'
    end
  end

  private

  def flat_user_params
    params.require(:flat_user).permit(:flat_code)
  end
end
