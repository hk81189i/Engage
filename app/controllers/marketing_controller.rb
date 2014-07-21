class MarketingController < ApplicationController

  def dashboard
    @cycle = params[:cycle]
    puts ("Cycle now has value #@cycle")
    if @cycle.nil?
      @cycle = 1
    end
@cycle =  @cycle.to_i
@cycle_before_last = Lead.cycle_before_period(@cycle)
  end

end
