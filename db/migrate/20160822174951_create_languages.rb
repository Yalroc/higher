class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :proficiency
      t.references :job_application, foreign_key: true

      t.timestamps
    end
  end
end
