namespace :median_salaries do
  desc "Derive Median Salaries"
  task derive: :environment do
    MedianSalary.delete_all
    titles = Salary.select(:job_title).distinct.map(&:job_title)
    titles.each do |title|
      median_salary = Salary.median_salary_by_job_title(title)
      MedianSalary.create(job_title: title.titlecase, salary: median_salary)
    end
  end
end
