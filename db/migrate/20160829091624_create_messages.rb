class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :job_application, foreign_key: true
      t.string :author_role
      t.text :content

      t.timestamps
    end
  end
end
