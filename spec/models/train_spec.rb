require 'rails_helper'

RSpec.describe Train, :type => :model do
  it "creates a service outage" do 
    t = Train.create
    expect { t.create_current_outage }.to change { ServiceOutage.count }.by(1) 
  end

  it "updates the end time of the current outage" do 
    t = Train.create
    t.create_current_outage
    t.end_current_outage
    expect { t.current_outage.outage_end }.to_not change { ServiceOutage.count }
  end
end
