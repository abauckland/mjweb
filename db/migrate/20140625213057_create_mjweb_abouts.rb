class CreateMjwebAbouts < ActiveRecord::Migration
  def change
    create_table :mjweb_abouts do |t|
      t.integer :company_id
      t.string :title
      t.text :text
      t.integer :image_id
      t.string :link_text
      t.string :link_url

      t.timestamps
    end
  end
end
