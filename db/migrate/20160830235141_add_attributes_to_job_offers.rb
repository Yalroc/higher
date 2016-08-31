class AddAttributesToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :job_offers, :location, :string
    add_column :job_offers, :min_xp, :decimal
    add_column :job_offers, :max_xp, :decimal
    add_column :job_offers, :salary, :integer
  end
end
