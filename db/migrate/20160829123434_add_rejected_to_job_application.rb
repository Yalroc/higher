class AddRejectedToJobApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :job_applications, :rejected, :boolean
  end
end
