class CreateMjwebTiles < ActiveRecord::Migration
  def change
    create_table :mjweb_tiles do |t|
      t.string :name
      t.string :partial_name
      t.integer :group

      t.timestamps
    end
  end
end
