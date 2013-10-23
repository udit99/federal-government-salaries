class TopTenController < ApplicationController

  def index
    @top_ten_salaries = Salary.top_ten_salaries
    @top_ten_bonuses = Salary.top_ten_bonuses
  end
end
