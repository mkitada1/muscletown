class RoutinesController < ApplicationController
  def r_index
    @routines = Routine.all
  end

  def new
  end

  def create
    Routine.create(title: "", body_parts: "", exercises: "", purpose: "", workouts: "")
  end
end
