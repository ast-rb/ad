class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.text :body
      t.timestamps
    end
    add_index :ads, :title

  end
end
