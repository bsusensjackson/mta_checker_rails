require 'rails_helper'
require 'spec_helper'

RSpec.describe 'JSONParser', :type => :model do 
  it "parses the JSON returned from the http parser" do 
    j = JSONParser.new(HttpWrapper.new)
    expect(j.parse).to be_instance_of(Hash)
  end

  it "returns the status for the specified subway line" do 
    j = JSONParser.new(HttpWrapper.new)
    j.parse
    status = j.find_status('ACE')
    expect(status['name']).to eq('ACE')
  end
end
