class AddOmniauthToRecruiters < ActiveRecord::Migration[5.0]
  def change
    add_column :recruiters, :provider, :string
    add_column :recruiters, :uid, :string
    add_column :recruiters, :token, :string
    add_column :recruiters, :token_expiry, :datetime
  end
end
