class ShotsController < ApplicationController
  def index
  end

  def safe_spot
    a = params[:a]
    a = a.to_i
    y = 2
    @safe_spot = y

    if a <= 0
      redirect_to shots_path, alert: "You must enter a number bigger than '0'."
    elsif a == 1
      redirect_to shots_path, notice: "There is no safe spot."
    elsif true && a & (a - 1) == 0
      redirect_to shots_path, notice: "The safe spot is #{a}."
    else
      c = 2**Math.log(a, 2).round(0)
      if
        c > a
        y = c - ((c - a) * 2)
        redirect_to shots_path, notice: "The safe spot is #{y}."
      else
        y = (a - c) * 2
        redirect_to shots_path, notice: "The safe spot is #{y}."
      end
    end
  end
end
