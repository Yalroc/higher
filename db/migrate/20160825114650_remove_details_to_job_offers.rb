class RemoveDetailsToJobOffers < ActiveRecord::Migration[5.0]
  def change
    remove_column :job_offers, :location, :string
    remove_column :job_offers, :contract, :string
    add_column  :job_offers, :title, :string
  end
end
