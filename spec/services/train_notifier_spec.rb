require 'rails_helper'
RSpec.describe "TrainNotifier" do 
  it "correctly evaluates the returned JSON" do 
    j = instance_double("JSONParser")
    allow(j).to receive(:parse) { {"responsecode"=>"0", "timestamp"=>"3/1/2015 11:10:00 AM", "subway"=> {"line"=>[{"name"=>"123", "status"=>"DELAYS", "text"=>{}, "Date"=>{}, "Time"=>{}}]}} }
    t = instance_double('Train', :name => '123', :current_outage => false)
    allow(t).to receive(:current_outage=)
    notifier = TrainNotifier.new(j)
    notifier.trains << t
    notifier.evaluate! 
    expect(t).to receive(:current_outage)
  end
  
  it "notifies the correct train if there is a new service outage" do 
    train = double(:train)
    
  end

  it "notifies the correct train if a service outage has ended"
end
