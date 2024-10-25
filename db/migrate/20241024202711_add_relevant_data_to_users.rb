class AddRelevantDataToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :experience_years, :integer
    add_column :users, :education_level, :string
    add_column :users, :skills, :text
    add_column :users, :previous_positions, :text
    add_column :users, :achievements, :text
    add_column :users, :references, :text
  end
end
