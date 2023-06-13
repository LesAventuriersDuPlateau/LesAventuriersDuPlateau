class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :image_url
      t.string :city
      t.integer :zip_code
      t.datetime :start_date
      t.integer :duration

      t.timestamps
    end
  end
end
