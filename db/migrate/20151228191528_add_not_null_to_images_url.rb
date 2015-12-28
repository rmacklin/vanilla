class AddNotNullToImagesUrl < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up { execute 'DELETE FROM images WHERE url IS NULL;' }
    end
    change_column_null :images, :url, false
  end
end
