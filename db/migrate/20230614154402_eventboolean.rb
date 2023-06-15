class Eventboolean < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :is_validate, :boolean, default: false
  end
end
