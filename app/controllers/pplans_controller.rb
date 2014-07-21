class PplansController < ApplicationController
  skip_before_filter :only_authenticated_admins_are_welcome, :only => :sendmail
  before_filter :authenticate_admin!
  before_action :set_pplan, only: [:show, :edit, :update, :destroy]

  # GET /pplans
  # GET /pplans.json
  def index
    @pplans = Pplan.all


    @pp_month_rm = @pplans.pp_month_rm(11, 6)
    @npp = @pplans.npp(2013, 6)
    @npp_cum = @pplans.npp_cum
    @tsr= Sale.tsr_month(2013, 6)
    @exp_cc= @pplans.exp_cc(6)
    @ubr = @pplans.ubr("Mumbai NOV",11)
    @pplans.totalsale(6)
  end

  def invoices

  end

def sendmail
FinanceMailer.freport.deliver
 redirect_to dashboard_index_path, notice: 'Sale was successfully updated.' 

end

  def batchrevreport
    @pplans = Pplan.all
    @batch = params[:rev_month]
    @exp_cc_month = params[:exp_cc_month]
    puts("Expected from a month #@exp_cc_month")
    if @batch == NIL
      @batch = "Mumbai NOV"
    end
    puts ("Batch now has value #@batch")
    @month = Batch.find_by(:name => @batch).date.month
    @ubr = @pplans.ubr(@batch, @month)
    @npp_cum = @pplans.npp_cum

    @exp_cc = @pplans.exp_cc(@exp_cc_month)


    @pm = params[:pm]
    puts("Expected from a  P month #@pm")
    @rm = params[:rm]
    puts("Expected from a  R  month #@rm")

    @pp_month_rm = @pplans.pp_month_rm(@pm, @rm)

  end


  def report_one
  end

  def report_two
    
    #=====
    Temp.delete_all
    @temp = Temp.all
    @month = params[:rep2_month]
    puts ("Month now has value #@month")
    @year = params[:rep2_year]

    if @year == NIL
      @year= Time.now.year
    end

    if @month == NIL
      @month = Time.now.month
    end

    @pplans = Pplan.all
    @tsr= Sale.tsr_month(@year, @month)
    @npp = @pplans.npp(@year, @month)
    @tsale = @pplans.totalsale(@month, @year)

    @in_payment_collected = Collection.in_payment_collected(@month , @year)
    @in_payment_not_collected = (Pplan.where("MONTH(paying_date) = ?" , @month).where("YEAR(paying_date) = ?" , @year).sum :amount) - @in_payment_collected

    @select_pplans = Pplan.where("MONTH(paying_date) = ?" , @month).where("YEAR(paying_date) = ?" , @year)

    @i = 1
    @count = @month.to_i
    $num =12

    while @i <= $num  do
      @am = 0
      @am = @select_pplans.where("MONTH(saledate) = ?" , @i).sum :amount
      @w = @select_pplans.joins(:batch).where("MONTH(batches.date) = ?", @i).where("YEAR(batches.date) = ?", @year).sum :amount
      if @am > 0 
        @date =  @select_pplans.where("MONTH(saledate) = ?" , @i).first.saledate
        Temp.create(:date => @date, :amount => @am, :estimate => @w )
      else if @w > 0
             @date = Batch.where("MONTH(date) = ?", @i).where("YEAR(date) = ?", @year).first.date
             Temp.create(:date => @date, :amount => @am, :estimate => @w )
           end
      end

      @i +=1
      if @count >12
        @count = 0
      end
      @count +=1
    end


    return @a
  end


  def report_three
  end

  def report_four
    @sale = Sale.all

    Temp.delete_all
    @temp = Temp.all
    @month = params[:rep2_month]
    @year = params[:rep2_year]
    if @year == nil
      @year= Time.now.year
    end
    if @month == nil
      @month = Time.now.month
    end
    logger.debug @year
    puts ("Month now has value #@year")
    puts @month


    @sale = Sale.where(payment_complete: nil)
    @sale.each do |sale|
      @pplan = sale.pplans.where(payment_complete: nil).where(['paying_date < ?', Date.today + 7.days ])

    end

  end


  def monthlyreport
    Temp.delete_all
    @temp = Temp.all
    @month = params[:temp_month]
    puts ("Month now has value #@month")
    @year = params[:temp_year]

    if @year == NIL
      @year= Time.now.year
    end
    if @month == NIL
      @month = Time.now.month
    end

    @pplans = Pplan.all
    @tsr= Sale.tsr_month(@year, @month)
    @npp = @pplans.npp(@year, @month)
    @tsale = Pplan.totalsale(@month, @year)
    @sales = @pplans.saledistribution(@month)


    @sales = Pplan.where('extract(year  from saledate) = ?', @year).where('extract(month from saledate) = ?', @month)
    puts ("Month has value as #@month")
    @i = @month.to_i
    @count = @month.to_i
    $num =13

    while @i < $num  do
      @am = @sales.where("MONTH(paying_date) = ?" , @i).sum :amount
      puts("Inside the loop i = #{@a}" )
      if @am >0
        @date =  @sales.where("MONTH(paying_date) = ?" , @i).first.paying_date
        @w = Pplan.joins(:batch).where("MONTH(saledate) = ?", @month).where("YEAR(batches.date) = ?", @year).where("MONTH(batches.date) = ?" , @count).sum :amount
        Temp.create(:date => @date, :amount => @am, :estimate => @w )
      end
      @i +=1
      if @count >12
        @count = 0
      end
      @count +=1
    end


     return @a
   end


   # GET /pplans/1
   # GET /pplans/1.json
   def show


  @sale = Sale.find(@pplan.sale_id)
  puts("The sale is") 
 logger.debug @sale

   end

 def approve_pplan
 @sale = Sale.find(@pplan.sale_id)
 puts("The sale is") 
logger.debug @sale
@sale.update(:approve => 1)


end

  # GET /pplans/new
  def new
    @pplan = Pplan.new
    @id = params[:id]
    logger.info @id
    @sale = Sale.find(@id)
    @pplan_now =  Pplan.where(:sale_id => @id)
    @total_pplan = @pplan_now.sum :amount
    @collection_now =  Collection.where(:sale_id => @id)
    @total_collection = @collection_now.sum :amount

  end

  # GET /pplans/1/edit
  def edit
Sale.find_by(:id => @pplan.sale_id).update(:approve => nil)
  end

  # POST /pplans
  # POST /pplans.json
  def create
    @pplan = Pplan.new(pplan_params)

    respond_to do |format|
      if @pplan.save
        @sale = Sale.find_by(:id => @pplan.sale_id)
        @sale.update(:approve => nil)
        @pplan.update(:saledate => @sale.saledate, :selling_price => @sale.selling_price, :contact_id => @sale.contact_id, :batch_id => @sale.batch_id )
        format.html { redirect_to new_pplan_path(:id => @sale.id) }
        format.json { render action: 'show', status: :created, location: @pplan }
        logger.debug @pplan.sale_id
      else
        format.html { render action: 'new' }
        format.json { render json: @pplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pplans/1
  # PATCH/PUT /pplans/1.json
  def update
    respond_to do |format|
      if @pplan.update(pplan_params)


        @sale = Sale.find_by(:id => @pplan.sale_id)
        @sale.update(:approve => nil)
        @pplan.update(:saledate => @sale.saledate, :selling_price => @sale.selling_price, :contact_id => @sale.contact_id, :batch_id => @sale.batch_id )


        format.html { redirect_to :back , notice: 'Pplan was successfully updated.' }
        format.json { head :no_content }


      else
        format.html { render action: 'edit' }
        format.json { render json: @pplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pplans/1
  # DELETE /pplans/1.json
  def destroy
    @pplan.destroy
    Sale.find_by(:id => @pplan.sale_id).update(:approve => nil)
    respond_to do |format|
      format.html { redirect_to :back  }
      format.json { head :no_content }
    end
  end


  def pp_month_rm(month, rm)
    @pplan = Pplan.where("MONTH(paying_date) = ?" , month).to_a
    @sale =  Sale.all  # Sale.salerecord_month(6)
    $length= @pplan.length
    puts ("length is #$length")

    @a=0
    while @a <= $length-1  do
      puts("value of @a")
      if @pplan[@a].sale.saledate == rm
        @totalformonth = @totalformonth + @pplan[@a].amount
        logger.debug(@totalformonth)
      end
    end
  end




  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pplan
    @pplan = Pplan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pplan_params
    params.require(:pplan).permit(:paying_date, :amount, :contact_id, :sale_id, :id,  :payment_complete)
  end
end

