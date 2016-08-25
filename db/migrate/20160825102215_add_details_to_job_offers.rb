class AddDetailsToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :job_offers, :contract, :string
    add_column :job_offers, :location, :string
  end
end
