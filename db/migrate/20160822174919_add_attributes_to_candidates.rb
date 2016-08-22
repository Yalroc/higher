class AddAttributesToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :first_name, :string
    add_column :candidates, :last_name, :string
    add_column :candidates, :phone_number, :string
  end
end
