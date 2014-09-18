class CreateMjwebFonts < ActiveRecord::Migration
  def change
    create_table :mjweb_fonts do |t|
      t.string :name
      t.string :style
      t.string :font
      t.timestamps
    end
  end
end
