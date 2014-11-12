class DropTopicTables < ActiveRecord::Migration
  def change

    drop_table :abouts
    drop_table :banks
    drop_table :books
    drop_table :products
    drop_table :services
    drop_table :networkings
    drop_table :trainings
    drop_table :webpages
    
  end
end
