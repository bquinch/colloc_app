class NotesController < ApplicationController
  def show
    @note = Note.find(params[:id])
    @note_answer = NoteAnswer.new
    @note_answers = NoteAnswer.where('note_id = ?', "#{params[:id]}")
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @flat_user = current_user.flat_user
    @note.flat_user = @flat_user
    if @note.save
      flash[:notice] = 'Note créée'
      redirect_to note_path(@note)
    else
      flash[:alert] = "Informations incomplètes"
      render :new
    end
  end

  private

  def note_params
    params.require('note').permit(:content)
  end
end
