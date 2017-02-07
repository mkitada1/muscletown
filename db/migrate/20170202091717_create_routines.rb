class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :title
      t.string :body_parts
      t.string :exercises
      t.text :purpose
      t.text :workouts

      t.timestamps
    end
  end
end
