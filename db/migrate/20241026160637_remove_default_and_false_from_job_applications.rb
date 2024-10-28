class RemoveDefaultAndFalseFromJobApplications < ActiveRecord::Migration[7.2]
  def change
    remove_column :job_applications, :default, :string
    remove_column :job_applications, :false, :string
  end
end
