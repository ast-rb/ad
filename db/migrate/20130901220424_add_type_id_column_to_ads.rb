class AddTypeIdColumnToAds < ActiveRecord::Migration
  def change
    add_column :ads, :type_id, :integer
  	add_index :ads, :type_id
  end
end
