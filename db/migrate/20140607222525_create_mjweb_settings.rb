class CreateMjwebSettings < ActiveRecord::Migration
  def change
    create_table :mjweb_settings do |t|

      t.timestamps
    end
  end
end
