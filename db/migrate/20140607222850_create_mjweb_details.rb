class CreateMjwebDetails < ActiveRecord::Migration
  def change
    create_table :mjweb_details do |t|
      t.integer :company_id
      t.string :subdomain_name
      t.string :tile_colour
      t.string :background
      t.string :font
      t.string :tagline
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday
      t.integer :ecommerce
      t.string :facebook
      t.string :twitter
      t.string :googleplus
      t.string :linkedin

      t.timestamps
    end
  end
end
