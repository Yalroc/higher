class AddTitleToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :job_offers, :title, :text
  end
end
