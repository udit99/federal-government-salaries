class AddSalaryCategory < ActiveRecord::Migration
  def change
    add_column :salaries, :salary_segment, :integer
    add_column :salaries, :bonus_segment, :integer
  end
end
