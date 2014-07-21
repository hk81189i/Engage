class OncourseExercise < ActiveRecord::Base
  validates_presence_of :prac_id, :change_agent_id, :precondition, :coach_name, :tti_days, on: :create


end
