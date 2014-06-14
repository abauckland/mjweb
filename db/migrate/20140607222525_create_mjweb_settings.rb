class CreateMjwebSettings < ActiveRecord::Migration
  def change
    create_table :mjweb_settings do |t|
      t.integer :company_id
      t.integer :tile_id
      t.integer :order
      t.integer :display
      t.string :link

      t.timestamps
    end
  end
end
