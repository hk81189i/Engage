class PconfirmsController < ApplicationController
  before_action :set_pconfirm, only: [:show, :edit, :update, :destroy]

  # GET /pconfirms
  # GET /pconfirms.json
  def index
    @pconfirms = Pconfirm.all
  end

  # GET /pconfirms/1
  # GET /pconfirms/1.json
  def show
    @duedate = Date.today + 3
@duedate =  @duedate.to_time.to_s
  end

  # GET /pconfirms/new
  def new
    @pconfirm = Pconfirm.new
  end

  # GET /pconfirms/1/edit
  def edit
  end

  # POST /pconfirms
  # POST /pconfirms.json
  def create
    @pconfirm = Pconfirm.new(pconfirm_params)

    respond_to do |format|
      if @pconfirm.save
        format.html { redirect_to @pconfirm, notice: 'Pconfirm was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pconfirm }
      else
        format.html { render action: 'new' }
        format.json { render json: @pconfirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pconfirms/1
  # PATCH/PUT /pconfirms/1.json
  def update
    respond_to do |format|
      if @pconfirm.update(pconfirm_params)
        format.html { redirect_to @pconfirm, notice: 'Pconfirm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pconfirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pconfirms/1
  # DELETE /pconfirms/1.json
  def destroy
    @pconfirm.destroy
    respond_to do |format|
      format.html { redirect_to pconfirms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pconfirm
      @pconfirm = Pconfirm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pconfirm_params
      params.require(:pconfirm).permit(:name, :email, :phone)
    end
end
