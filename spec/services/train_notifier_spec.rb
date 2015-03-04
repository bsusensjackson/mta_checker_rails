require 'rails_helper'
RSpec.describe "TrainNotifier" do 
  it "correctly evaluates the returned JSON" do 
  end
  
  it "notifies the correct train if there is a new service outage" do 
    j = instance_double("JSONParser")
    allow(j).to receive(:parse) { {"responsecode"=>"0", "timestamp"=>"3/1/2015 11:10:00 AM", "subway"=> {"line"=>[{"name"=>"123", "status"=>"DELAYS", "text"=>{}, "Date"=>{}, "Time"=>{}}]}} }
    t = double('Train', :name => '123', :current_outage => false)
    allow(t).to receive(:set_current_outage=)
    allow(t).to receive(:save)
    notifier = TrainNotifier.new(j)
    notifier.trains << t
    notifier.evaluate! 
    expect(t).to have_received(:set_current_outage=).with(true)
  end

  it "notifies the correct train if a service outage has ended" do 
    j = instance_double("JSONParser")
    allow(j).to receive(:parse) { {"responsecode"=>"0", "timestamp"=>"3/1/2015 11:10:00 AM", "subway"=> {"line"=>[{"name"=>"123", "status"=>"GOOD SERVICE", "text"=>{}, "Date"=>{}, "Time"=>{}}]}} }
    t = double('Train', :name => '123', :current_outage => true)
    allow(t).to receive(:set_current_outage=)
    allow(t).to receive(:save)
    notifier = TrainNotifier.new(j)
    notifier.trains << t
    notifier.evaluate! 
    expect(t).to have_received(:set_current_outage=).with(false)
  end

  it "changes a train's status if specified" do 
    t = double('Train', :current_outage => false)  
    j = instance_double("JSONParser")
    allow(j).to receive(:parse)
    allow(t).to receive(:set_current_outage=)
    allow(t).to receive(:save)
    notifier = TrainNotifier.new(j).change_train_status(t)
    expect(t).to have_received(:set_current_outage=).with(true)
  end
end
