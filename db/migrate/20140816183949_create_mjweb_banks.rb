class CreateMjwebBanks < ActiveRecord::Migration
  def change
    create_table :mjweb_banks do |t|
      t.integer :company_id
      t.string :title
      t.text :text
      t.string :link_text
      t.string :link_url
      t.integer :image_id

      t.timestamps
    end
  end
end
