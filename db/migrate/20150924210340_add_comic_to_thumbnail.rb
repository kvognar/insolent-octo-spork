class AddComicToThumbnail < ActiveRecord::Migration
  def change
    add_reference :thumbnails, :comic, index: true, foreign_key: true, null: false
  end
end
