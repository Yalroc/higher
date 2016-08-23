class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.integer :company_size
      t.string :industry
      t.string :organization
      t.references :job_application, foreign_key: true
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.boolean :present

      t.timestamps
    end
  end
end
