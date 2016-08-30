class AddViewedToJobApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :job_applications, :viewed, :boolean
  end
end
