json.array!(@oncourse_exercises) do |oncourse_exercise|
  json.extract! oncourse_exercise, :prac_name, :change_agent, :precondition, :technique, :postcondition, :tti_date, :test, :futurepacing, :coach_name
  json.url oncourse_exercise_url(oncourse_exercise, format: :json)
end
