class AddCheckedToJobApplications < ActiveRecord::Migration[7.2]
  def change
    add_column :job_applications, :checked, :boolean, default: false
  end
end
