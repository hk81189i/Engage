class CustomftypesController < ApplicationController
  before_action :set_customftype, only: [:show, :edit, :update, :destroy]

  # GET /customftypes
  # GET /customftypes.json
  def index
    @customftypes = Customftype.all
  end

  # GET /customftypes/1
  # GET /customftypes/1.json
  def show
  end

  # GET /customftypes/new
  def new
    @customftype = Customftype.new
  end

  # GET /customftypes/1/edit
  def edit
  end

  # POST /customftypes
  # POST /customftypes.json
  def create
    @customftype = Customftype.new(customftype_params)

    respond_to do |format|
      if @customftype.save
        format.html { redirect_to @customftype, notice: 'Customftype was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customftype }
      else
        format.html { render action: 'new' }
        format.json { render json: @customftype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customftypes/1
  # PATCH/PUT /customftypes/1.json
  def update
    respond_to do |format|
      if @customftype.update(customftype_params)
        format.html { redirect_to @customftype, notice: 'Customftype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customftype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customftypes/1
  # DELETE /customftypes/1.json
  def destroy
    @customftype.destroy
    respond_to do |format|
      format.html { redirect_to customftypes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customftype
      @customftype = Customftype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customftype_params
      params.require(:customftype).permit(:name)
    end
end
