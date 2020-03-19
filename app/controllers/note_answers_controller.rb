class NoteAnswersController < ApplicationController
  def create
    @note_answer = NoteAnswer.new(note_answer_params)
    @note = Note.find(params[:note_id])
    @flat_user = current_user.flat_user
    @note_answer.note = @note
    @note_answer.flat_user = @flat_user
    if @note_answer.save
      flash[:notice] = 'Réponse envoyée'
      redirect_to note_path(@note)
    else
      flash[:alert] = 'Erreur lors de la réponse'
      render "notes/#{@note.id}"
    end
  end

  private

  def note_answer_params
    params.require('note_answer').permit(:content)
  end
end
