class AddAttributesToJobApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :job_applications, :submit, :boolean
    add_column :job_applications, :contact, :boolean
  end
end
