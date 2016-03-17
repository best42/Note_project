# == Schema Information
#
# Table name: note_images
#
#  id                 :integer          not null, primary key
#  image_id           :integer
#  x                  :integer
#  y                  :integer
#  content            :text
#  note_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class NoteImagesController < ApplicationController
  before_action :set_note_image, only: [:show, :edit, :update, :destroy]
  before_action :set_note

  # GET /note_images
  # GET /note_images.json
  def index
    @note_images = NoteImage.all
  end

  # GET /note_images/1
  # GET /note_images/1.json
  def show
  end

  # GET /note_images/new
  def new
    @note_image = NoteImage.new
  end

  # GET /note_images/1/edit
  def edit
  end

  # POST /note_images
  # POST /note_images.json
  def create
    @note_image = NoteImage.new(note_image_params)
    @note_image.note_id = @note.id

    respond_to do |format|
      if @note_image.save
        format.html { redirect_to edit_note_path(@note), notice: 'Note image was successfully created.' }
        # format.json { render :show, status: :created, location: @note_image }
      else
        format.html { render :new }
        format.json { render json: @note_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_images/1
  # PATCH/PUT /note_images/1.json
  def update
    respond_to do |format|
      if @note_image.update(note_image_params)
        format.html { redirect_to @note_image, notice: 'Note image was successfully updated.' }
        format.json { render :show, status: :ok, location: @note_image }
      else
        format.html { render :edit }
        format.json { render json: @note_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_images/1
  # DELETE /note_images/1.json
  def destroy
    @note_image.destroy
    respond_to do |format|
      format.html { redirect_to note_images_url, notice: 'Note image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_image
      @note_image = NoteImage.find(params[:id])
    end
    def set_note
      @note = Note.find(params[:note_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_image_params
      params.require(:note_image).permit(:image_id, :x, :y, :content, :note_id, :image)
    end
end
