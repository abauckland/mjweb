class CreateMjwebImagesettings < ActiveRecord::Migration
  def change
    create_table :mjweb_imagesettings do |t|
      t.integer :image_id
      t.integer :content_id

      t.timestamps
    end
  end
end
