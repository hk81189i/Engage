class OncourseExercisesController < ApplicationController
  before_action :set_oncourse_exercise, only: [:show, :edit, :update, :destroy]

  # GET /oncourse_exercises
  # GET /oncourse_exercises.json
  def index
    @oncourse_exercises = OncourseExercise.all



  end

  # GET /oncourse_exercises/1
  # GET /oncourse_exercises/1.json
  def show
@prac = Contact.find_by(:id =>  @oncourse_exercise.prac_id )
@change_agent = Contact.find_by(:id =>  @oncourse_exercise.change_agent_id)
  end

  # GET /oncourse_exercises/new
  def new
    @oncourse_exercise = OncourseExercise.new
    @batch =  Batch.all  # for choosing batch in form 
    @batch_id = params[:getbatch]
    puts ("Month now has value #@month")
    if @batch_id == NIL
      @batch_id = 42
    end
    @sales =  Sale.where(:batch_id => @batch_id)
  end

  # GET /oncourse_exercises/1/edit
  def edit
  end

  # POST /oncourse_exercises
  # POST /oncourse_exercises.json
  def create
    @oncourse_exercise = OncourseExercise.new(oncourse_exercise_params)

    respond_to do |format|
      if @oncourse_exercise.save
@tti_date = @oncourse_exercise.date + @oncourse_exercise.tti_days 
@oncourse_exercise.update(:tti_date => @tti_date)
        format.html { redirect_to @oncourse_exercise, notice: 'Oncourse exercise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @oncourse_exercise }
      else
        format.html { render action: 'new' }
        format.json { render json: @oncourse_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oncourse_exercises/1
  # PATCH/PUT /oncourse_exercises/1.json
  def update
    respond_to do |format|
      if @oncourse_exercise.update(oncourse_exercise_params)
@tti_date = @oncourse_exercise.date + @oncourse_exercise.tti_days 
@oncourse_exercise.update(:tti_date => @tti_date)
        format.html { redirect_to @oncourse_exercise, notice: 'Oncourse exercise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @oncourse_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oncourse_exercises/1
  # DELETE /oncourse_exercises/1.json
  def destroy
    @oncourse_exercise.destroy
    respond_to do |format|
      format.html { redirect_to oncourse_exercises_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oncourse_exercise
      @oncourse_exercise = OncourseExercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oncourse_exercise_params

      params.require(:oncourse_exercise).permit(:date, :prac_id, :change_agent_id, :precondition, :technique, :postcondition, :tti_date, :tti_days, :test, :futurepacing, :coach_name)
    end
end
