require 'rails_helper'

RSpec.describe "HttpWrapper" do 
  it "correctly sets the URL if none is provided" do 
    h = HttpWrapper.new
    expect(h.url).to eq 'http://www.mta.info/service_status_json'
  end

  it "returns json" do 
    h = HttpWrapper.new
    expect(h.call.content_type).to eq("application/json")
  end
end
