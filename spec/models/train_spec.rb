require 'rails_helper'

RSpec.describe Train, :type => :model do
  it "creates a service outage when notified" do 
    expect {  Train.look_for_service_status! }.to change { ServiceOutage.count }.by(1)
  end
end
