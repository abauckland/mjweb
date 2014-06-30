class CreateMjwebImages < ActiveRecord::Migration
  def change
    create_table :mjweb_images do |t|
      t.integer :company_id
      t.string :name
      t.string :image
      t.timestamps
    end
  end
end
