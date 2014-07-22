class SuccessDashboardController < ApplicationController
require 'rubygems'
# require 'prawn'

def showbatch
@batch =  Batch.all
    @batch_id = params[:temp_month]
    puts ("Month now has value #@month")

    if @batch_id == NIL
      @batch_id = Time.now.month
    end

@sales =  Sale.where(:batch_id => @batch_id)

end



def showcontact
@contact_id = params[:contact_id]
 puts ("Contactid now has value #@contact_id")

@forms =  Internalform.all.where(:campaign => 1)


end




end
