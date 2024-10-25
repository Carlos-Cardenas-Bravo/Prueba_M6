class ModifyUsersForProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :skills, :text
    remove_column :users, :achievements, :text
    remove_column :users, :references, :text
  end
end