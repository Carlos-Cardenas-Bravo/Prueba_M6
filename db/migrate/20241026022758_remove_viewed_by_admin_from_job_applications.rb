class RemoveViewedByAdminFromJobApplications < ActiveRecord::Migration[7.2]
  def change
    remove_column :job_applications, :viewed_by_admin, :boolean
  end
end
