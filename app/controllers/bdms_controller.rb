class BdmsController < ApplicationController
before_filter :authenticate_user!
  before_action :set_bdm, only: [:show, :edit, :update, :destroy]

  # GET /bdms
  # GET /bdms.json
  def index
    @bdms = Bdm.all
  end

  # GET /bdms/1
  # GET /bdms/1.json
  def show
  end

  # GET /bdms/new
  def new
    @bdm = Bdm.new
  end

  # GET /bdms/1/edit
  def edit
  end

  # POST /bdms
  # POST /bdms.json
  def create
    @bdm = Bdm.new(bdm_params)

    respond_to do |format|
      if @bdm.save
        format.html { redirect_to @bdm, notice: 'Bdm was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bdm }
      else
        format.html { render action: 'new' }
        format.json { render json: @bdm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bdms/1
  # PATCH/PUT /bdms/1.json
  def update
    respond_to do |format|
      if @bdm.update(bdm_params)
        format.html { redirect_to @bdm, notice: 'Bdm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bdm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdms/1
  # DELETE /bdms/1.json
  def destroy
    @bdm.destroy
    respond_to do |format|
      format.html { redirect_to bdms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bdm
      @bdm = Bdm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bdm_params
      params.require(:bdm).permit(:name, :email, :phone)
    end
end
