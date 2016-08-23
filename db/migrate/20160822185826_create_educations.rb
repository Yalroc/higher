class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.date :start_date
      t.date :end_date
      t.string :title
      t.text :description
      t.boolean :present
      t.string :degree_type
      t.string :degree_field
      t.string :organization
      t.references :job_application, foreign_key: true

      t.timestamps
    end
  end
end
