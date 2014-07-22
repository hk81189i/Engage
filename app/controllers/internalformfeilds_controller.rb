class InternalformfeildsController < ApplicationController
  before_action :set_internalformfeild, only: [:show, :edit, :update, :destroy]

  # GET /internalformfeilds
  # GET /internalformfeilds.json
  def index
    @internalformfeilds = Internalformfeild.all
  end

  # GET /internalformfeilds/1
  # GET /internalformfeilds/1.json
  def show
#if @internalformfeild.customftype_id == 4
#Dropbox.create(:internalformfeild_id =>  @internalformfeild.internalform_id)


 # format.html { redirect_to new_dropboxfeild_path ( :id => @dropbox.id), notice: 'Please enter the dropbox feilds.' }
#else 
# end
@dropboxfeild =  Dropboxfeild.new
  end

  # GET /internalformfeilds/new
  def new
    @internalformfeild = Internalformfeild.new
@internalform_id = params[:internalform_id]

  end

  # GET /internalformfeilds/1/edit
  def edit
@internalform_id = params[:internalform_id]
  end

  # POST /internalformfeilds
  # POST /internalformfeilds.json
  def create
    @internalformfeild = Internalformfeild.new(internalformfeild_params)

    respond_to do |format|
      if @internalformfeild.save
        format.html { redirect_to @internalformfeild, notice: 'Internalformfeild was successfully created.' }
        format.json { render action: 'show', status: :created, location: @internalformfeild }
      else
        format.html { render action: 'new' }
        format.json { render json: @internalformfeild.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internalformfeilds/1
  # PATCH/PUT /internalformfeilds/1.json
  def update
    respond_to do |format|
      if @internalformfeild.update(internalformfeild_params)
        format.html { redirect_to @internalformfeild, notice: 'Internalformfeild was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @internalformfeild.errors, status: :unprocessable_entity }
      end
    end
  end


  def showformfeild
    @id = params[:id]
    @internalformfeild = params[:internalformfeild]
    puts @internalformfeild
    if !@internalformfeild.nil?
      @internalformfeild.each do |feild|
        puts feild["sort"]
        puts feild["internalform_id"]
        @record = Internalformfeild.find_by(:id => feild["internalform_id"])
        if  !feild["sort"].empty?
          @record.update(:sort => feild["sort"])
        else
          #
        end
      end  # do ends
    else
      #
    end

    
    @internalformfeilds =  Internalformfeild.where(:internalform_id => @id).order("sort ASC")


  end

  def up
   
 
  end

  def down
  end



  # DELETE /internalformfeilds/1
  # DELETE /internalformfeilds/1.json
  def destroy
    @internalformfeild.destroy
    respond_to do |format|
      format.html { redirect_to internalformfeilds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internalformfeild
      @internalformfeild = Internalformfeild.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internalformfeild_params
      params.require(:internalformfeild).permit(:internalform_id, :customftype_id, :cfeild, :required, :sort, :helptext)
    end
end
