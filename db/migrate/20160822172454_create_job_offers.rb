class CreateJobOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_offers do |t|
      t.references :recruiter
      t.text :description

      t.timestamps
    end
  end
end
