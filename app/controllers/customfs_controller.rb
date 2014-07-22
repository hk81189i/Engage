class CustomfsController < ApplicationController
  before_action :set_customf, only: [:show, :edit, :update, :destroy]

  # GET /customfs
  # GET /customfs.json
  def index
    @customfs = Customf.all
  end

  # GET /customfs/1
  # GET /customfs/1.json
  def show
  end

  # GET /customfs/new
  def new
    @customf = Customf.new
  end

  # GET /customfs/1/edit
  def edit
  end

  # POST /customfs
  # POST /customfs.json
  def create
    @customf = Customf.new(customf_params)

    respond_to do |format|
      if @customf.save
        format.html { redirect_to @customf, notice: 'Customf was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customf }
      else
        format.html { render action: 'new' }
        format.json { render json: @customf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customfs/1
  # PATCH/PUT /customfs/1.json
  def update
    respond_to do |format|
      if @customf.update(customf_params)
        format.html { redirect_to @customf, notice: 'Customf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customfs/1
  # DELETE /customfs/1.json
  def destroy
    @customf.destroy
    respond_to do |format|
      format.html { redirect_to customfs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customf
      @customf = Customf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customf_params
      params.require(:customf).permit(:name)
    end
end
