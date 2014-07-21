class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def generate
    @id =  params[:id]
    @collection = Collection.find(@id) 
    collection     = @collection  

    if !@collection.contact_id.nil?

      if collection.contact.name.nil?
        @name =  collection.contact.fname.to_s + "" + collection.contact.lname.to_s
      else
        @name =  collection.contact.name
      end
      @amountinpp = Pplan.where(:contact_id => collection.contact_id).where(:sale_id => collection.sale_id).sum :amount
      @amount_collected = Collection.where(:sale_id => collection.sale_id).where(:contact_id => collection.contact_id).sum :amount
      @collection_current = collection.amount
      @id = collection.id

@invoice =    Invoice.create(:sale_id => collection.sale_id, :name => @name, :contact_id => collection.contact_id, :amount_collected => @amount_collected, :amount_pplan => @amountinpp, :collection_current => @collection_current)

      @collection.update(:invoicing_status => 1, :invoice_id => @invoice.id)      
    end

    respond_to do |format|
      format.html { redirect_to dashboard_index_path }
      format.json { head :no_content }
    end

#    render inline: "Done!"
  end



  def index

    @invoices = Invoice.all


    @pending = Collection.where(:invoicing_status != 1)

    if @pending != nil 

      @pending.each do |collection|

        if collection.contact_id != nil

          if collection.contact.name.nil?
            @name =  collection.contact.fname.to_s + "" + collection.contact.lname.to_s
          else
            @name =  collection.contact.name
          end
          @amountinpp = Pplan.where(:contact_id => collection.contact_id).where(:sale_id => collection.sale_id).sum :amount
          @amount_collected = Collection.where(:sale_id => collection.sale_id).where(:contact_id => collection.contact_id).sum :amount
          @collection_current = collection.amount
          @id = collection.id

          Invoice.create(:sale_id => collection.sale_id, :name => @name, :contact_id => collection.contact_id, :amount_collected => @amount_collected, :amount_pplan => @amountinpp, :collection_current => @collection_current)

          @invoice = Invoice.find_by(:sale_id => collection.sale_id)
          @entry = Collection.find_by(:id => @id)
          @entry.update(:invoicing_status => 1, :invoice_id => @invoice.id)      
        end

      end
    end

    respond_to do |format|
      format.html { redirect_to dashboard_index_path }
      format.json { head :no_content }
    end


  end


  # GET /invoices/1
  # GET /invoices/1.json
  def show


    if @invoice == nil
      respond_to do |format|
        format.html { redirect_to dashboard_index_path }
        format.json { head :no_content }
      end
    end

  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invoice_params
    params.require(:invoice).permit(:name, :approve, :contact_id , :amount_collected, :amount_pplan , :collection_current )
  end
end
