class SalesController < ApplicationController
  protect_from_forgery :only => [:delete]
  skip_before_filter :only_authenticated_admins_are_welcome, :only => :sendmail
  before_action :set_sale, only: [:show, :edit, :update, :destroy]


  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.paginate(:page => params[:page], :per_page => 35)
  end

  # GET /sales/1
  # GET /sales/1.json
  def salecomplete  # for report 4on dashboard
    @batch =  Batch.all
    @batch_id = params[:temp_month]
    puts ("Month now has value #@month")
    if @batch_id == NIL
      @batch_id = 15
    end
    @sales =  Sale.where(:batch_id => @batch_id)
  end

  def dashboard
    @allfresh =  Lead.all_fresh
    @allcontacting =  Lead.all_contacting
    @allworking = Lead.all_working
    @allclosing = Lead.all_closing

    @leadstoday = Lead.todaysleads

    # code for checking whom the lead is assigned to on the Google spreadsheet'
    session = GoogleDrive.login("leads@soexcellence.com", "djduYs&5")
    ws1 = session.spreadsheet_by_key("0AjohTKNw_a7edGpOMzhBeDJqVzJzUVhPVGNHVTJoV0E").worksheets[0]
    time = Time.new
    currentday = time.day
    @bdlist = []
    for row in 1..ws1.num_rows
      rowday = ws1[row,1].to_i
      if(currentday == rowday)
        @bdlist = ws1[row,4].split(",")
      end
    end

    @member = []
    logger.debug "Member: #{@member.inspect}"
    if  !@bdlist.empty?
      @bdlist.each do |i|
i.inspect
        @admin = Admin.find_by(:email => i)
        @member.push(@admin.admin_name)
      end
    end

  end  

  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end
  

def sendmail
SalesMailer.salesdashboard.deliver
 redirect_to dashboard_index_path, notice: 'Sale was successfully updated.' 
end


  # POST /sales

  # POST /sales.json
  def create
    @sale =  Sale.new(sale_params)

    if !@sale.saledate.nil? && (@sale.saledate > 2014-01-01)
respond_to do |format|
          format.html { render action: 'new', notice:" The following caused errors. Please check."  }
        end
# render action: 'new' , notice: "Saledate is in 2014. Migration is only for sales in Nov-Dec 2013"
    else

      if @sale.save
        @name = @sale.fname + " " + @sale.lname
        @contact = Contact.create(:name => @name, :fname =>@sale.fname, :lname => @sale.lname, :infu_id => @sale.infu_id, :email => @sale.email, :phone => @sale.phone)
        @batch = Batch.find_by(:name => @sale.infu_batch)
        @sale.update(:contact_id => @contact.id, :batch_id =>@batch.id, :batchdate => @batch.date)

        respond_to do |format|
          format.html {   redirect_to @sale, notice:"The sale was successfully added" }
        end

      else
        respond_to do |format|
          format.html { render action: 'new', notice:" The following caused errors. Please check."  }
        end
      end
    end    
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update

logger.info params["up_sess"]


      if @sale.update(sale_params)
        if (params["up_sess"] ==  "Incomplete"  || params["up_sess"] == "Complete")


 redirect_to sales_salecomplete_path
          
        else
          @sale.update(:approve => 1)
          require 'xmlrpc/client'
          @key="693a317c912f96cca8ac329986fe7663"
          @server = XMLRPC::Client.new2("https://zh160.infusionsoft.com:443/api/xmlrpc")
          @server.call("FunnelService.achieveGoal",@key,'zh160','salecomplete', @sale.infu_id)
#    render inline: "Done!"
redirect_to dashboard_index_path
#          format.json { head :no_content }
        end

      else
#        format.html { render action: 'edit' }
 #       format.json { render json: @sale.errors, status: :unprocessable_entity }
      end

  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end

  def manualadd
#    @sale =  Sale.new(sale_params)   
  end

  def manuallyadd
    @sale =  Sale.new(sale_params)


  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sale_params
    params.require(:sale).permit(:contact_id, :infu_id, :fname, :lname, :infu_owner_name, :infu_owner_id, :infu_owner_email, :referal_code, :referal_id,  :email, :batch_id,  :product_id, :selling_price, :inf_owner_id, :saledate, :owner_id,  :infu_batch, :phone, :approve, :sent_first_invoice, :payment_complete )
  end
end
