class RenameImageUriToUrl < ActiveRecord::Migration
  def change
    rename_column :images, :uri, :url
  end
end
