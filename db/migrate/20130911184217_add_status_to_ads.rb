class AddStatusToAds < ActiveRecord::Migration
  def change
    add_column :ads, :status, :string
  end
end
