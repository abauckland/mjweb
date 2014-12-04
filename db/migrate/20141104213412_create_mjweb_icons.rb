class CreateMjwebIcons < ActiveRecord::Migration
  def change
    create_table :mjweb_icons do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
