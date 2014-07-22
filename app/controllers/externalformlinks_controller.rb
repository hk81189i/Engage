class ExternalformlinksController < ApplicationController
  before_action :set_externalformlink, only: [:show, :edit, :update, :destroy]

  # GET /externalformlinks
  # GET /externalformlinks.json
  def index
    @externalformlinks = Externalformlink.all
  end

  # GET /externalformlinks/1
  # GET /externalformlinks/1.json
  def show
  end

  # GET /externalformlinks/new
  def new
    @externalformlink = Externalformlink.new
  end

  # GET /externalformlinks/1/edit
  def edit
  end

  # POST /externalformlinks
  # POST /externalformlinks.json
  def create
    @externalformlink = Externalformlink.new(externalformlink_params)

    respond_to do |format|
      if @externalformlink.save
        format.html { redirect_to @externalformlink, notice: 'Externalformlink was successfully created.' }
        format.json { render action: 'show', status: :created, location: @externalformlink }
      else
        format.html { render action: 'new' }
        format.json { render json: @externalformlink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /externalformlinks/1
  # PATCH/PUT /externalformlinks/1.json
  def update
    respond_to do |format|
      if @externalformlink.update(externalformlink_params)
        format.html { redirect_to @externalformlink, notice: 'Externalformlink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @externalformlink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /externalformlinks/1
  # DELETE /externalformlinks/1.json
  def destroy
    @externalformlink.destroy
    respond_to do |format|
      format.html { redirect_to externalformlinks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_externalformlink
      @externalformlink = Externalformlink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def externalformlink_params
      params.require(:externalformlink).permit(:contact_id, :link, :form_id)
    end
end
