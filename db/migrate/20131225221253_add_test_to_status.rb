class AddTestToStatus < ActiveRecord::Migration
  def change
  	add_column :statuses, :test, :string
  end
end
