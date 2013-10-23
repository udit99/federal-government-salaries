namespace :update_segments do
  desc "Update salary segments"
  task salary: :environment do
    count = Salary.count
    Salary.all.find_in_batches do |group|
      group.each_with_index do |s, index|
        s.salary_segment = s.base_salary_segment
        s.save
        puts "saved #{index} of #{count}"
      end
    end
  end
end
