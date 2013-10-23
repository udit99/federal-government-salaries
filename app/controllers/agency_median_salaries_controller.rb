class AgencyMedianSalariesController < ApplicationController

  def index
    median_salaries = Rails.cache.fetch('median_salaries_by_agency', :expires_in => 96.hours){
      AgencyMedianSalary.all.order(:median_salary)
    }
    respond_to do |format|
      format.html
      format.json{
        render json: median_salaries.to_json
      }
    end
  end
end
