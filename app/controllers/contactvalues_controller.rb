class ContactvaluesController < ApplicationController
# prawnto :prawn => { :top_margin => 75 }
# require 'rubygems'
# require 'prawn'

  before_action :set_contactvalue, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_admin!
  before_filter :cv , only: [:create]

  # GET /contactvalues                                                                                                                            
  # GET /contactvalues.json                                                                                                                       
  def index
    @contactvalues = Contactvalue.all
  end

  # GET /contactvalues/1                                                                                                                          
  # GET /contactvalues/1.json                                                                                                                     
  def show
  end

  # GET /contactvalues/new                                                                                                                        
  def new
    @contactvalue = Contactvalue.new

    # @contactvalue = Contactvalue.find(params[:id])                                                                                              
    @reviews = Array.new(3) { @contactdata.reviews.build }
  end

  # GET /contactvalues/1/edit                                                                                                                     
  def edit
  end

  # POST /contactvalues                                                                                                                           
  # POST /contactvalues.json         

  def create
    logger.debug contactvalue_params.count
    contactvalue_params.each do |contactvalue_param|

      @contactvalue = Contactvalue.new(contactvalue_param)
      @flag = true

      logger.debug @contactvalue.data
      if !@contactvalue.save
        @flag = false
      end
    end
    if(@flag == true)

      @infu_id = Contact.find(@contactvalue.contact_id).infu_id

      require 'xmlrpc/client'
      @key="693a317c912f96cca8ac329986fe7663"
      @server = XMLRPC::Client.new2("https://zh160.infusionsoft.com:443/api/xmlrpc")
      @server.call("FunnelService.achieveGoal",@key,'zh160','campname', @infu_id)

      #  redirect_to @contactvalue, notice: 'All Values! successfully created.                                                                    




      redirect_to :action=>'showsubmit', :contact_id => @contactvalue.contact_id, :internalform_id =>  @contactvalue.internalform_id

    else
      # redirect womewhere else on error                                                                                                          
      @internalform = Internalform.find_by(:id => @contactvalue.internalform_id)
      redirect_to internalform_path(@internalform, {:contact_id => @contactvalue.contact_id, :error => @contactvalue.errors})
      puts @contactvalue.errors.full_messages.each do |msg|
        puts msg
      end

    end

  end


  def showsubmit
    @internalform_id = params[:internalform_id]
    @contact_id = params[:contact_id]
logger.debug @contact_id
    @contactvalues =  Contactvalue.where(:contact_id => @contact_id).where(:internalform_id => @internalform_id)
@pdfname = @contact_id.to_s + "_" + Contact.find(@contact_id).fname.to_s



end

  def download 
    @internalform_id = params[:internalform_id]
    @contact_id = params[:contact_id]
    logger.debug @contact_id
    @contactvalues =  Contactvalue.where(:contact_id => @contact_id).where(:internalform_id => @internalform_id)
    @pdfname = @contact_id.to_s + "_" + Contact.find(@contact_id).fname.to_s


    html = render_to_string(:action => :showsubmit, :layout => "pdf_layout.html.erb") 
    pdf = WickedPdf.new.pdf_from_string(html) 
    send_data(pdf, 
              :filename    =>  @pdfname ,
              :disposition => 'attachment' ,
              :header => { :right => '[page] of [topage]' },
              :margin => {:top                => 18   })         # default 10 (mm)
    end

  # PATCH/PUT /contactvalues/1                                                                                                                    
  # PATCH/PUT /contactvalues/1.json                                                                                                               
  def update
    respond_to do |format|
      if @contactvalue.update(contactvalue_params)
        format.html { redirect_to @contactvalue, notice: 'Contactvalue was successfully updated.' }
        format.json { head :no_content }
 format.pdf do
        pdf = CustomerPdf.new(@contactvalue)
        send_data pdf.render, filename: "customer_#{id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
     end
      else
        format.html { render action: 'edit' }
        format.json { render json: @contactvalue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contactvalues/1                                                                                                                       
  # DELETE /contactvalues/1.json                                                                                                                  
  def destroy
    @contactvalue.destroy
    respond_to do |format|
      format.html { redirect_to contactvalues_url }
      format.json { head :no_content }
    end
  end



  def cv
    @arr =  Array.new
    contactvalue_params.each do |contactvalue_param|
      @contactvalue = Contactvalue.new(contactvalue_param)
      @internalform = Internalform.find_by(:id => @contactvalue.internalform_id)
      @existing_contact = Contactvalue.where(:contact_id => @contactvalue.contact_id, :internalform_id =>  @internalform.id, :customf => @contactvalue.customf)

      if !@existing_contact.empty?
        @arr.push("You have already filled this form. If you wish to submit again, please write to support@soexcellence.com")
        break
      else
        if @contactvalue.data_required.nil? # check for required feild filled- validation                                                           
        else
          @arr.push(@contactvalue.data_required)
        end

      end

    end

    # redirect womewhere else on error   

    if @arr.empty?

    else

      if @internalform.formtype == "External" 
        @key = Externalformlink.find_by(:contact_id => @contactvalue.contact_id, :form_id => @internalform.id)
        redirect_to internalform_path(@internalform, {:contact_id => @contactvalue.contact_id, :key => @key.string,  :error => @arr})
      else
        redirect_to internalform_path(@internalform, {:contact_id => @contactvalue.contact_id, :error => @arr})

      end

    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.                                                                           
  def set_contactvalue
    @contactvalue = Contactvalue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.                                                            
  def contactvalue_params
    params.require(:contactvalue)
    #permit(:contactvalue =>{:customf=>"Distance", :data =>[]} )                                                                                  

    # ({:customf => []}, :data => [ :name, { :family => [ :name ], :hobbies => [] }])                                                             
    #.permit({:contact_id, :customftype, :customf, :data})                                                                                        

  end
end





