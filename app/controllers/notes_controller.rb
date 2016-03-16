# == Schema Information
#
# Table name: notes
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :text
#  subject            :string
#  teacher            :text
#  rating             :integer
#  user_id            :integer
#  create_note        :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :description, :subject, :teacher, :rating, :user_id, :create_note, :image, image_attributes: [:id])
    end
end
