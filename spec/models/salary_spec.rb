require 'spec_helper'

describe Salary do
  describe "#base_salary_segment" do
    it "should have the appropriate salary segment" do
      [[7890,10], [16001,20], [34567,30]].each do |arr|
        salary = Salary.new(base_salary: arr[0])
        salary.base_salary_segment.should == arr[1]
      end
    end
  end

  describe ".group_by_segment" do
    before do
      Salary.create(base_salary: 23456, salary_segment: 20)
      Salary.create(base_salary: 33456, salary_segment: 40)
      Salary.create(base_salary: 40001, salary_segment: 40)
      Salary.create(base_salary: 49999, salary_segment: 50)
      Salary.create(base_salary: 73456, salary_segment: 70)
      Salary.create(base_salary: 70002, salary_segment: 70)
    end

    it "should return a hash of salary counts grouped by segment" do
      expected = [nil,nil,1,nil,2,1,nil,2]
      Salary.group_by_segment.should == expected
    end
  end

  describe ".median_salary_by_job_title" do
    before do
      Salary.create(base_salary: 23456, job_title: 'janitor')
      Salary.create(base_salary: 33456, job_title: 'janitor')
      Salary.create(base_salary: 40001, job_title: 'janitor')
      Salary.create(base_salary: 49999, job_title: 'janitor')
      Salary.create(base_salary: 73456, job_title: 'janitor')
    end
    it "should return a median salary of 40001" do
      Salary.median_salary_by_job_title('janitor').should == 40001
    end
    it "should return a median salary of 40002" do
      Salary.create(base_salary: 40003, job_title: 'janitor')
      Salary.median_salary_by_job_title('janitor').should == 40002
    end
    
  end

  describe ".median_salary_by_agency" do
    before do
      Salary.create(base_salary: 23456, agency: 'DOD')
      Salary.create(base_salary: 33456, agency: 'DOD')
      Salary.create(base_salary: 40001, agency: 'DOD')
      Salary.create(base_salary: 49999, agency: 'DOD')
      Salary.create(base_salary: 73456, agency: 'DOD')
    end
    it "should return a median salary of 40001" do
      Salary.median_salary_by_agency('DOD').should == 40001
    end
    it "should return a median salary of 40002" do
      Salary.create(base_salary: 40003, agency: 'DOD')
      Salary.median_salary_by_agency('DOD').should == 40002
    end
    
  end
end
