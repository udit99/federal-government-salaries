class AddDepartmentToMedianSalaries < ActiveRecord::Migration
  def change
    change_table :median_salaries do |t|
      t.string :agency
    end
  end
end
