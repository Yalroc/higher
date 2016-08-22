class CreateJobApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :job_applications do |t|
      t.reference :candidate
      t.reference :job_offer
      t.text :cover_letter

      t.timestamps
    end
  end
end
