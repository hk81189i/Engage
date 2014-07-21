class CollectionsController < ApplicationController

  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all.order("id DESC").paginate(:page => params[:page], :per_page => 100)

    logger.debug "@collection: #{@collections.inspect}" 

# Delete permission
    deletelist = ['gowri.ramachandran@soexcellence.com', 'antano@soexcellence.com', 'harikrishnan@soexcellence.com', 'harini@soexcellence.com',  'sankari.b@soexcellence.com']
    receiptapplist = ['sankari.b@soexcellence.com', 'antano@soexcellence.com', 'harikrishnan@soexcellence.com', 'harini@soexcellence.com',  ]
    # Delete Permission and Receipt Approval Permission                                                                                          
    deletelist.each do |dlcontact|
      if(dlcontact == current_admin.email)
        @dlp = true
        break
      end
    end

    receiptapplist.each do |racontact|
      if(racontact == current_admin.email)
	@rap = true
        break
      end
    end

  end

  # GET /collections/1
  # GET /collections/1.json
  def show   

  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
    @new_customers_for_select = Collection.new_customers_for_select
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to dashboard_index_path, notice: 'payment was successfully Added.' }
        format.json { render action: 'show', status: :created, location: @collection }
        @email = "retailsales@soexcellence.com"
        @created_by = current_admin.admin_name
        @amount = @collection.amount
        @mode = @collection.mode
@subject = "New payment of Rs." + @collection.amount.to_s + " on Teampayment sheet"
        require 'mandrill'
        mandrill = Mandrill::API.new 'K_BSD_BCZDxpusNCmpoChQ'
        template_name = 'teampayment_added'
        templatedata = [{name: "amount",
                          content: @amount }, {name: "mode",
                          content: @mode }, {name: "by", content: @created_by }
                       ]

        template_content = []
        message = {"from_name"=> "Treasure Hunt","recipient_metadata"=>[{"rcpt"=> @email}],"important"=>true, "from_email"=> 
          "gowri.ramachandran@soexcellence.com","subject"=> @subject, "to"=>[{"email"=> @email, "name"=> @owner_name }],"merge"=>true,"global_merge_vars"=> templatedata}
        mandrill.messages.send_template template_name, template_content, message

        # @sale = Sale.find_by(:contact_id => @collection.contact_id)
        # @collection.update(:sale_id => @sale.id)

      else
        format.html { render action: 'new' }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    @new_customers_for_select = Collection.new_customers_for_select
    respond_to do |format|
      if @collection.update(collection_params)
        # Update the respective contact_id to the collection record. Dashboard will show as unclaimed if thi sis not done. 
        if @collection.sale.nil? 
          @collection.update(:contact_id => nil, :invoice_id => nil, :invoicing_status => nil)
        else
          @collection.update(:contact_id => @collection.sale.contact_id)
          @Collected = Collection.where(:sale_id => @collection.sale_id).sum :amount
          @SP = Sale.where(:id => @collection.sale_id).first.selling_price
          if @Collected == @SP
            Sale.where(:id => @collection.sale_id).first.update(:payment_complete => 1)  # Marking Payment complete. Last Invoice will go out based on this.
          end
        end

        format.html { redirect_to :controller=>'invoices', :action=>'generate', :id => @collection.id}
  # redirect_to internalform_path(@internalform, {:contact_id => @contact_id})
        format.json { head :no_content }

      else
        format.html { render action: 'edit' }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end 




  def invoice
  end



  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_index_path }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_collection
    @collection = Collection.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def collection_params
    params.require(:collection).permit(:date, :amount, :payment_details,  :contact_id, :sale_id, :mode, :comments)
  end

end
