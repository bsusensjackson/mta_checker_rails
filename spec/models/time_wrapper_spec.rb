require 'rails_helper'
require 'spec_helper'

RSpec.describe "TimeWrapper" do 
  it "returns a time object" do 
    expect(TimeWrapper.new.current).to be_instance_of(Time)
  end
end
