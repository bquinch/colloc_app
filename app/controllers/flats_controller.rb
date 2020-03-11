class FlatsController < ApplicationController
  before_action :set_flat, only: %I[show edit update destroy]
  before_action :authorize_user, only: %I[edit destroy]
  def index
    @flats = Flat.all
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.flat_code = create_flat_code
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat), notice: 'Appartement créé'
    else
      render :new, notice: "Erreur lors de la création de la création de l'appartement"
    end
  end

  def edit; end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat), notice: "Appartement modifié"
    else
      render :edit, notice: "Impossible de modifier"
    end
  end

  def destroy
    @flat.destroy
    redirect_to root_url, notice: "L'appartement a été supprimé"
  end

  private

  def create_flat_code
    "#{number}#{letter}#{letter}#{letter}#{number}#{number}#{number}"
  end

  def number
    rand(1..9)
  end

  def letter
    ('a'..'z').to_a.sample.upcase
  end

  def flat_params
    params.require(:flat).permit(:title, :description, :address)
  end

  def set_flat
    @flat = Flat.find(params(:id))
  end

  def authorize_user
    redirect_to flat_path(@flat) unless @flat.user == current_user
  end
end
