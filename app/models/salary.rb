class Salary < ActiveRecord::Base
  SEGMENT_SIZE = 10_000.0

  def base_salary_segment
    (base_salary / SEGMENT_SIZE).round * 10
  end

  def self.group_by_segment
    salaries = self.select("salary_segment, count(*) as count").group(:salary_segment)
    counts = []
    salaries.each do |salary|
      counts[salary.salary_segment/10] = salary.count
    end
    counts
  end

  def self.median_salary_by_job_title(job_title)
    jobs = self.where(job_title: job_title).order(:base_salary)
    halfway_mark = jobs.length/2
    jobs.length.odd? ? jobs[halfway_mark].base_salary : (jobs[halfway_mark].base_salary + jobs[halfway_mark - 1].base_salary)/2
  end

  def self.median_salary_by_agency(agency)
    salaries = Salary.where(:agency => agency).order(:base_salary).map(&:base_salary)
    halfway_mark = salaries.length/2
    salaries.length.odd? ? salaries[halfway_mark] : (salaries[halfway_mark] + salaries[halfway_mark - 1])/2
  end

  def self.top_ten_salaries
    self.all.order("base_salary desc").limit(10)
  end

  def self.top_ten_bonuses
    self.all.order("award_bonus desc").limit(10)
  end
end
