class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.string :name
      t.string :agency
      t.string :division
      t.string :job_title
      t.string :state_or_country
      t.string :county
      t.string :station
      t.string :plan_grade
      t.integer :base_salary
      t.integer :award_bonus
      t.string :serialid
    end
  end
end

#name,agency,division,job_title,state_or_country,county,station,plan_grade,base_salary,award_bonus,serialid
