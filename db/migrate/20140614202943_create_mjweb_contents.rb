class CreateMjwebContents < ActiveRecord::Migration
  def change
    create_table :mjweb_contents do |t|
      t.integer :company_id
      t.integer :tile_id
      t.integer :order
      t.string :display
      t.string :link

      t.timestamps
    end
  end
end
