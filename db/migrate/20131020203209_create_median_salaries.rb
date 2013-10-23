class CreateMedianSalaries < ActiveRecord::Migration
  def change
    create_table :median_salaries do |t|
      t.string :job_title
      t.integer :salary
    end
  end
end
