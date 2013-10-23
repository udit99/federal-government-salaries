namespace :update do
  desc "Update agency median salaries"
  task agency_median_salaries: :environment do
    AgencyMedianSalary.delete_all
    Salary.select(:agency).distinct(:agency).map(&:agency).each do |agency|
      median_salary = Salary.median_salary_by_agency(agency)
      AgencyMedianSalary.create(agency: agency.titlecase, median_salary: median_salary)
    end
  end
end
