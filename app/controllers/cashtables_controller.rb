class CashtablesController < ApplicationController
  before_action :set_cashtable, only: [:show, :edit, :update, :destroy]

  # GET /cashtables
  # GET /cashtables.json
  def index
    @cashtables = Cashtable.all





  end

  # GET /cashtables/1
  # GET /cashtables/1.json
  def show
  end

  # GET /cashtables/new
  def new
    @cashtable = Cashtable.new
  end


def cashreportone

@cashtable = Cashtable.all

@batch= @cashtable.where("year = '2013'")

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


end



  # GET /cashtables/1/edit
  def edit
  end

  # POST /cashtables
  # POST /cashtables.json
  def create
    @cashtable = Cashtable.new(cashtable_params)

    respond_to do |format|
      if @cashtable.save
        format.html { redirect_to @cashtable, notice: 'Cashtable was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cashtable }
      else
        format.html { render action: 'new' }
        format.json { render json: @cashtable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cashtables/1
  # PATCH/PUT /cashtables/1.json
  def update
    respond_to do |format|
      if @cashtable.update(cashtable_params)
        format.html { redirect_to @cashtable, notice: 'Cashtable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cashtable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashtables/1
  # DELETE /cashtables/1.json
  def destroy
    @cashtable.destroy
    respond_to do |format|
      format.html { redirect_to cashtables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cashtable
      @cashtable = Cashtable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cashtable_params
      params.require(:cashtable).permit(:year, :jan, :feb, :mar, :apr, :may, :jun, :july, :aug, :sept, :oct, :nov, :dec, :lead_id, :bdm_id)
    end
end
