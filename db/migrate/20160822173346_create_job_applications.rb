class CreateJobApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :job_applications do |t|
      t.references :candidate
      t.references :job_offer
      t.text :motivation_letter

      t.timestamps
    end
  end
end
