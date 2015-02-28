class AddCurrentDelayToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :current_outage, :boolean, default: false
  end
end
