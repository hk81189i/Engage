
class PaymentPlansController < ApplicationController
  before_action :set_payment_plan, only: [:show, :edit, :update, :destroy]

  # GET /payment_plans
  # GET /payment_plans.json
  def index
    @payment_plans = PaymentPlan.all
  end

  # GET /payment_plans/1
  # GET /payment_plans/1.json
  def show

  end

def reportone
@payment_plan = PaymentPlan.all
@cashtable = Cashtable.all

@batch= @payment_plan.where("year = '2013'")

@pplan = @batch.to_a
puts(" size of array is" )
$length= @pplan.length
logger.debug($length)
@first = @pplan[1].jun
logger.debug(@first)

@total = 0


#calculating for every month

@a=0
while @a < $length  do
   puts("value of jan" )
  @total = @total + @pplan[@a].jan
   @a +=1

puts("Total #@total")
end


@a=0
while @a < $length  do
   puts("value of dec" )

  @totaldec = @totaldec.to_i + @pplan[@a].dec
   @a +=1

puts("Total #@totaldec")
end


@a=0
while @a < $length  do
   puts("value of mar" )

  @totalmar = @totalmar.to_i + @pplan[@a].mar
   @a +=1

puts("Total #@totalmar")
end


@a=0
while @a < $length  do
   puts("value of  April" )

  @totalapr = @totalapr.to_i + @pplan[@a].apr
   @a +=1

puts("Total #@totalapr")
end


@a=0
while @a < $length  do
   puts("value of May" )


  @totalmay = @totalmay.to_i + @pplan[@a].may
   @a +=1

puts("Total for may #@totalmay")
end


@a=0
while @a < $length  do
   puts("value of May" )


  @totalfeb = @totalfeb.to_i + @pplan[@a].feb
   @a +=1

puts("Total for may #@totalfeb")
end


@a=0
while @a < $length  do
   puts("value of May" )


  @totaljun = @totaljun.to_i + @pplan[@a].jun
   @a +=1

puts("Total for may #@totaljun")
end


@a=0
while @a < $length  do
   puts("value of May" )


  @totaljuly = @totaljuly.to_i + @pplan[@a].july
   @a +=1

puts("Total for may #@totaljuly")
end



@a=0
while @a < $length  do
   puts("value of May" )


  @totalaug = @totalaug.to_i + @pplan[@a].aug
   @a +=1

puts("Total for may #@totalaug")
end


@a=0
while @a < $length  do
   puts("value of May" )


  @totalsept = @totalsept.to_i + @pplan[@a].sept
   @a +=1

puts("Total for may #@totalsept")
end


@a=0
while @a < $length  do
   puts("value of May" )


  @totalnov = @totalnov.to_i + @pplan[@a].nov
   @a +=1

puts("Total for may #@totalnov")
end



@a=0
while @a < $length  do
   puts("value of May" )


  @totaloct = @totaloct.to_i + @pplan[@a].oct
   @a +=1

puts("Total for may #@totalnov")
end



@grandtotal = @total +@totalfeb + @totalmar + @totalapr + @totalmay +@totaljun + @totaljuly + @totalaug  + @totalsept  + @totaloct   + @totalnov   + @totaldec


@grandpaymenttotal = @grandtotal

@totalrevenueinjune = @totalrevenue
puts ("revenue #@totalrevenueinjune")
end

def  month(a)
case a
when 1
return jan
when 2 
return feb
when 3
return mar
when 4 
return apr
end
end

def movetocash
@payment_plan = PaymentPlan.all
@pplan= @payment_plan.where("year = '2013'")
logger.debug(@pplan)
@pplan.each do |pp|
pp.jun =  pp.jun.to_i
@total = @total.to_i + pp.jun
logger.debug(@total)
print @total
end
return @total
end

  # GET /payment_plans/new
  def new
    @payment_plan = PaymentPlan.new
  end

  # GET /payment_plans/1/edit
  def edit
  end

  # POST /payment_plans
  # POST /payment_plans.json
  def create
    @payment_plan = PaymentPlan.new(payment_plan_params)

    respond_to do |format|
      if @payment_plan.save
        format.html { redirect_to @payment_plan, notice: 'Payment plan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment_plan }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_plans/1
  # PATCH/PUT /payment_plans/1.json
  def update
    respond_to do |format|
      if @payment_plan.update(payment_plan_params)
        format.html { redirect_to @payment_plan, notice: 'Payment plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_plans/1
  # DELETE /payment_plans/1.json
  def destroy
    @payment_plan.destroy
    respond_to do |format|
      format.html { redirect_to payment_plans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_plan
      @payment_plan = PaymentPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_plan_params
      params.require(:payment_plan).permit(:year, :jan, :feb, :mar, :apr, :may, :jun, :july, :aug, :sept, :oct, :nov, :dec, :lead_id, :bdm_id)
    end
end
