class RemoveTitleToJobOffers < ActiveRecord::Migration[5.0]
  def change
    remove_column :job_offers, :title, :text
  end
end
