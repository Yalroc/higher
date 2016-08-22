class AddAttributesToRecruiters < ActiveRecord::Migration[5.0]
  def change
    add_column :recruiters, :title, :string
    add_reference :recruiters, :organization, foreign_key: true
  end
end
