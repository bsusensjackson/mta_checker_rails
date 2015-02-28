require 'rails_helper'
require 'spec_helper'

RSpec.describe 'JSONParser', :type => :model do 
  it "calls the API" do 
    response = JSONParser.call
    expect(response.header).to match /json/
  end

  it "returns the status for the specified subway" do 
    train = 'ACE'
    JSONParser.call
    p status = JSONParser.find_status(train)
    p status.first['name']
    expect(status.first['name']).to eq "ACE" 
  end
end
