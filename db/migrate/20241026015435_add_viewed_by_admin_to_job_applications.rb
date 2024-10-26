class AddViewedByAdminToJobApplications < ActiveRecord::Migration[7.2]
  def change
    add_column :job_applications, :viewed_by_admin, :boolean
    add_column :job_applications, :default, :string
    add_column :job_applications, :false, :string
  end
end
