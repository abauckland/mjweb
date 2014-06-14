class CreateMjwebServices < ActiveRecord::Migration
  def change
    create_table :mjweb_services do |t|
      t.integer :company_id
      t.string :text

      t.timestamps
    end
  end
end
