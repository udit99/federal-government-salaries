class HomeController < ApplicationController

  def index
    @agency = Rails.cache.fetch('agency', :expires_in => 96.hours){
      Salary.select(:agency).distinct.map(&:agency).sort.map{|agency| [agency.titlecase, agency]}
     }
    @division = Rails.cache.fetch('division', :expires_in => 96.hours){ 
      Salary.select(:division).distinct.map(&:division).sort.map{|division| [division.titlecase, division]}
    }
    @job_title = Rails.cache.fetch('job_title', :expires_in => 96.hours){ 
      Salary.select(:job_title).distinct.map(&:job_title).sort.map{|jt| [jt.titlecase, jt]}
    }
    @state_or_country = Rails.cache.fetch('state_or_country', :expires_in => 96.hours) {
      Salary.select(:state_or_country).distinct.map(&:state_or_country).sort
    }
    @county = Rails.cache.fetch('county', :expires_in => 96.hours) {
      Salary.select(:county).distinct.map(&:county).sort
    }
  end
end
