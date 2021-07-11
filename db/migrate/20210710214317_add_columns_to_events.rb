class AddColumnsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :name, :string
    add_column :events, :description, :string
    add_column :events, :location, :string
    add_column :events, :category, :string
    add_column :events, :start_date, :string
    add_column :events, :end_date, :string
    add_column :events, :start_time, :string
    add_column :events, :end_time, :string
    add_column :events, :paid, :boolean
  end
end
