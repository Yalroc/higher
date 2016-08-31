class AddPhotoUrlToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column  :organizations, :photo_url, :string
  end
end
