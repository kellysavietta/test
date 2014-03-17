
class NotesController < ApplicationController

  def index
    @search = Note.search(params[:search])
    binding.pry
    @notes = @search.all
    @title = view_context.title_helper("dogs are awesome")
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to(@note, notice: 'Note was saved successfully')
    else
      render 'new'
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(notes_path) }
      format.xml  { head :ok }
    end
  end


end
