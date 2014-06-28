class CreateMjwebDetails < ActiveRecord::Migration
  def change
    create_table :mjweb_details do |t|

      t.string :tagline
      t.integer :company_id
      t.integer :ecommerce
      t.string :facebook
      t.string :twitter
      t.string :googleplus
      t.string :linkedin

      t.timestamps
    end
  end
end
