class DashboardController < ApplicationController

  def index
# require 'chronic' 
    deletelist = ['gowri.ramachandran@soexcellence.com', 'antano@soexcellence.com', 'harikrishnan@soexcellence.com', 'harini@soexcellence.com']
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



    @pplans =  Pplan.all
    @sales = Sale.all.limit 8

    @collections = Collection.all.limit 8


    @year  =Time.now.year.to_i 
    @month = Time.now.month


    @pplans = Pplan.all
    @tsr= Sale.tsr_month(@year, @month)
    @npp = @pplans.npp(@year, @month)
    @tsale = @pplans.totalsale(@month,@year)

    @in_payment_collected = Collection.in_payment_collected(@month , @year)
    @in_payment_not_collected = (Pplan.where("MONTH(paying_date) = ?" , @month).where("YEAR(paying_date) = ?" , @year).sum :amount) - @in_payment_collected


    @count =0
    @sale = Sale.where(:payment_complete => nil)
    @sale.each do |sale|
      @pplan_count = sale.pplans.where(:payment_complete => nil).where(['paying_date < ?', Date.today + 7.days ])
      if @pplan_count.empty?
        @this_count = 0
      else
        @this_count = @pplan_count.count
      end
      @count = @count  + @this_count
    end 


    @sale = Sale.where(payment_complete: nil)
    @sale.each do |sale|
      @pplan = sale.pplans.where(payment_complete: nil).where(['paying_date < ?', Date.today + 7.days ])
@icount = @pplan.count
    end
@count = @count + @icount


    @overdue_count = 0
    overdue_sale =  Sale.where(batchdate: (Time.now.midnight - 1.day)..Time.now + 1.year)  
    overdue_sale.each do |sale| 
      overdue_sp = sale.selling_price 
      overdue_pplan= (Pplan.where(:contact_id => sale.contact_id).sum :amount) 
      if (overdue_sp - overdue_pplan) >= 0 
        @overdue_count = @overdue_count + 1 
      end
    end

  end


  def show


  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @collection }


      else
        format.html { render action: 'new' }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

end
