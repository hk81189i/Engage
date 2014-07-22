class InternalformsController < ApplicationController
  before_action :set_internalform, only: [:show, :edit, :update, :destroy]
#   before_action :authenticate, :only => [:show]
  skip_before_filter :authenticate_admin!, :only => [:show, :create]


  # GET /internalforms
  # GET /internalforms.json
  def index
    @internalforms = Internalform.all
  end

  # GET /internalforms/1
  # GET /internalforms/1.json
  def show
    @contactvalue =  Contactvalue.new
    @contact_id = params[:contact_id]
    puts ("contact is #@contact_id")
    @form_id =  params[:id]
    @key = params[:key]
    if Internalform.find(@form_id).formtype == "Internal"
      @check = ["I am not empty"]
    else
      @check =  Externalformlink.where(:contact_id => @contact_id, :form_id => @form_id, :string => @key)
      @check.blank?
      puts(" Check is #@check")
      puts(" string is #@string")
    end

  end

  # GET /internalforms/new
  def new
    @internalform = Internalform.new
    #    @internalform = Internalform.find(params[:id])
    #   @contactvalues = Array.new(3) { @internalform.contactvalues.build }
  end

  # GET /internalforms/1/edit
  def edit
  end

  # POST /internalforms
  # POST /internalforms.json
  def create
    @internalform = Internalform.new(internalform_params)
    #   @internalform = Internalform.find(params[:id])
    # @contactvalues = Contactvalue.create(params[:contactvalue])

    respond_to do |format|
      if @internalform.save
        format.html { redirect_to new_internalformfeild_path( :internalform_id => @internalform.id), notice: 'Internalform was successfully created.' }
                format.json { render action: 'show', status: :created, location: @internalform }
      else
        format.html { render action: 'new' }
        format.json { render json: @internalform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internalforms/1
  # PATCH/PUT /internalforms/1.json
  def update
    respond_to do |format|
      if @internalform.update(internalform_params)
        format.html { redirect_to @internalform, notice: 'Internalform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @internalform.errors, status: :unprocessable_entity }
      end
    end
  end

  def selectform
    @internalforms = Internalform.all
    @contact_id = params[:contact]
    logger.debug @contact_id
    @internalform_id  =  params[:internalform_id]
    puts ("contact is #@contact_id")
    puts ("internal form id is #@internalform_id")
    if params[:internalform_id] != nil
      puts "if executing"
      @internalform = Internalform.find(params[:internalform_id])
      if @internalform.formtype == "Internal"
        redirect_to internalform_path(@internalform, {:contact_id => @contact_id})
      else 

a = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
@string = a.shuffle.first(16).join
        @link1 = "internalforms/" 
        @link2 =  @internalform_id.to_s
        @link3 =  "?contact_id=" 
        @link4 = @contact_id.to_s 
        @link5 = "&key="
        @link = @link1.to_s + @link2 + @link3 + @link4.to_s + @link5.to_s + @string 
        Externalformlink.create(:contact_id => @contact_id.to_i, :link => @link, :form_id => @internalform.id, :string => @string)

     end
    else
      puts "else executing"
    end
  end

  # DELETE /internalforms/1
  # DELETE /internalforms/1.json
  def destroy
    @internalform.destroy
    respond_to do |format|
      format.html { redirect_to internalforms_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_internalform
    @internalform = Internalform.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def internalform_params
    params.require(:internalform).permit(:name, :internalform_feild_id, :goal, :campaign, :formtype, :contactdata)
  end
end
