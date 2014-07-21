class CreateOncourseExercises < ActiveRecord::Migration
  def change
    create_table :oncourse_exercises do |t|
      t.string :prac_name
      t.string :change_agent
      t.string :precondition
      t.string :technique
      t.string :postcondition
      t.string :tti_date
      t.string :test
      t.string :futurepacing
      t.string :coach_name

      t.timestamps
    end
  end
end
