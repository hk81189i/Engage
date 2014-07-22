class DropboxesController < ApplicationController
  before_action :set_dropbox, only: [:show, :edit, :update, :destroy]

  # GET /dropboxes
  # GET /dropboxes.json
  def index
    @dropboxes = Dropbox.all
  end

  # GET /dropboxes/1
  # GET /dropboxes/1.json
  def show
  end

  # GET /dropboxes/new
  def new
    @dropbox = Dropbox.new
  end

  # GET /dropboxes/1/edit
  def edit
  end

  # POST /dropboxes
  # POST /dropboxes.json
  def create
    @dropbox = Dropbox.new(dropbox_params)

    respond_to do |format|
      if @dropbox.save
        format.html { redirect_to @dropbox, notice: 'Dropbox was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dropbox }
      else
        format.html { render action: 'new' }
        format.json { render json: @dropbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dropboxes/1
  # PATCH/PUT /dropboxes/1.json
  def update
    respond_to do |format|
      if @dropbox.update(dropbox_params)
        format.html { redirect_to @dropbox, notice: 'Dropbox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dropbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dropboxes/1
  # DELETE /dropboxes/1.json
  def destroy
    @dropbox.destroy
    respond_to do |format|
      format.html { redirect_to dropboxes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dropbox
      @dropbox = Dropbox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dropbox_params
      params.require(:dropbox).permit(:internalformfeild_id)
    end
end
