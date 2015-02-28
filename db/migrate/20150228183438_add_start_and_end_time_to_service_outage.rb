class AddStartAndEndTimeToServiceOutage < ActiveRecord::Migration
  def change
    add_column :service_outages, :outage_start, :datetime
    add_column :service_outages, :outage_end, :datetime
  end
end
