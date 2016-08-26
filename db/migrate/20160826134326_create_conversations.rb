class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :candidate, foreign_key: true
      t.references :job_offer, foreign_key: true

      t.timestamps
    end
  end
end
