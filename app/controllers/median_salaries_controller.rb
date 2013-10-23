class MedianSalariesController < ApplicationController

  def index
    median_salaries = Rails.cache.fetch('median_salaries_by_job_title', :expires_in => 96.hours) do
      MedianSalary.all.order(:salary)
    end
    respond_to do |f|
      f.html
      f.json { render json: median_salaries.to_json }
    end
  end
end
