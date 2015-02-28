class CreateServiceOutage < ActiveRecord::Migration
  def change
    create_table :service_outages do |t|
      t.references :train
      t.timestamps null: false
    end
  end
end
