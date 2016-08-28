class AddOmniauthToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :provider, :string
    add_column :candidates, :uid, :string
    add_column :candidates, :token, :string
    add_column :candidates, :token_expiry, :datetime
  end
end
