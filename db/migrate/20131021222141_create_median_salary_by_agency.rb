class CreateMedianSalaryByAgency < ActiveRecord::Migration
  def change
    create_table :agency_median_salaries do |t|
      t.string :agency
      t.integer :median_salary
    end
  end
end
