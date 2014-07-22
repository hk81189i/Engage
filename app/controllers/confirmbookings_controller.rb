class ConfirmbookingsController < ApplicationController
  before_action :set_confirmbooking, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_admin!
  # GET /confirmbookings
  # GET /confirmbookings.json
  def index
    @confirmbookings = Confirmbooking.all
  end

  # GET /confirmbookings/1
  # GET /confirmbookings/1.json
  def show
  end

  # GET /confirmbookings/new
  def new
    @confirmbooking = Confirmbooking.new
  end

  def newb
    @confirmseatbooking = Confirmbooking.new
  end

  # GET /confirmbookings/1/edit
  def edit
  end

def participationconfirmed
@duedate = Date.today + 3.days

end

  # POST /confirmbookings
  # POST /confirmbookings.json
  def create
    @confirmbooking = Confirmbooking.new(confirmbooking_params)

    respond_to do |format|
      if @confirmbooking.save
      @lead_name= @confirmbooking.name
      @email = @confirmbooking.email  
      require 'mandrill'
      mandrill = Mandrill::API.new 'K_BSD_BCZDxpusNCmpoChQ'
      template_name = 'bookingconfirmed'
      templatedata = [{name: "name",
                        content: @lead_name }
                     ]

      template_content = []
      message = {"from_name"=> "School of Excellence","recipient_metadata"=>[{"rcpt"=> @email}],"important"=>true, "from_email"=> 
        "registrations@soexcellence.com","subject"=>"Congratulations! uPwithNLP Training Booked","to"=>[{"email"=> @email, "name"=> @lead_name }],"merge"=>true,"global_merge_vars"=> templatedata}
      mandrill.messages.send_template template_name, template_content, message

        format.html { redirect_to participationconfirmed_path, notice: 'Confirmbooking was successfully created.' }
        format.json { render action: 'show', status: :created, location: @confirmbooking }
      else
        format.html { render action: 'new' }
        format.json { render json: @confirmbooking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /confirmbookings/1
  # PATCH/PUT /confirmbookings/1.json
  def update
    respond_to do |format|
      if @confirmbooking.update(confirmbooking_params)
        format.html { redirect_to @confirmbooking, notice: 'Confirmbooking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @confirmbooking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmbookings/1
  # DELETE /confirmbookings/1.json
  def destroy
    @confirmbooking.destroy
    respond_to do |format|
      format.html { redirect_to confirmbookings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confirmbooking
      @confirmbooking = Confirmbooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirmbooking_params
      params.require(:confirmbooking).permit(:name, :email, :phone, :city, :batch, :change1, :change2, :change3, :thing1, :thing2, :thing3, :dream1, :dream2, :dream3 )
    end
end
