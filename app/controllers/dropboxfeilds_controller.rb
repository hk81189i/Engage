class DropboxfeildsController < ApplicationController
  before_action :set_dropboxfeild, only: [:show, :edit, :update, :destroy]

  # GET /dropboxfeilds
  # GET /dropboxfeilds.json
  def index
    @dropboxfeilds = Dropboxfeild.all
  end

  # GET /dropboxfeilds/1
  # GET /dropboxfeilds/1.json
  def show
  end

  # GET /dropboxfeilds/new
  def new
    @dropboxfeild = Dropboxfeild.new
  end

  # GET /dropboxfeilds/1/edit
  def edit
  end

  # POST /dropboxfeilds
  # POST /dropboxfeilds.json
  def create
    @dropboxfeild = Dropboxfeild.new(dropboxfeild_params)

    respond_to do |format|
      if @dropboxfeild.save
   format.html { redirect_to internalformfeild_path(:id => @dropboxfeild.internalformfeild_id),  notice: 'Dropboxfeild was successfully created.' }

        format.json { render action: 'show', status: :created, location: @dropboxfeild }
      else
        format.html { render action: 'new' }
        format.json { render json: @dropboxfeild.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dropboxfeilds/1
  # PATCH/PUT /dropboxfeilds/1.json
  def update
    respond_to do |format|
      if @dropboxfeild.update(dropboxfeild_params)
        format.html { redirect_to @dropboxfeild, notice: 'Dropboxfeild was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dropboxfeild.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dropboxfeilds/1
  # DELETE /dropboxfeilds/1.json
  def destroy
    @dropboxfeild.destroy
    respond_to do |format|
      format.html { redirect_to dropboxfeilds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dropboxfeild
      @dropboxfeild = Dropboxfeild.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dropboxfeild_params
      params.require(:dropboxfeild).permit(:options, :dropbox_id, :internalformfeild_id)
    end
end
