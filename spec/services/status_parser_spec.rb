require 'rails_helper'

RSpec.describe "StatusIdentifier" do 
  describe "#StatusParser.find_trains!" do 
    it "correctly identifies multiple trains with delays" do 
      string = "<span class='TitleDelay'>Delays</span>                    <span class='DateStyle'>                    &nbsp;Posted:&nbsp;03/02/2015&nbsp; 2:03PM                    </span><br/><br/>                  <P>Due to track maintenance at <STRONG>149 St-Grand Concourse</STRONG>, southbound [2] and [5] trains are running with delays.</P><P>Allow additional travel time.</P>                <br/><br/>"
      trains = StatusParser.find_trains!(string)
      expect(trains).to eq ["2", "5"]
    end

    it "correctly identifies a single train delay" do 
      string = "                    <span class='TitleServiceChange' >Service Change</span>                    <span class='DateStyle'>                    &nbsp;Posted:&nbsp;03/02/2015&nbsp; 8:01PM                    </span><br/><br/>                  <P>Due to a rail condition at <STRONG>Grant Av</STRONG>, the following service changes are in effect: </P><P>Southbound [A] trains are running with delays.</P><P>Some southbound [A] trains terminate at<STRONG> Euclid Av</STRONG>. </P><P>Allow additional travel time.</P>                <br/><br/>              "
      trains = StatusParser.find_trains!(string)
      expect(trains).to eq ["A"]
    end
  end

  describe '#StatusParser.find_start_time!' do 
    it "correctly finds a time with a leading single digit" do 
      string = "<span class='TitleDelay'>Delays</span>                    <span class='DateStyle'>                    &nbsp;Posted:&nbsp;03/02/2015&nbsp; 2:03PM                    </span><br/><br/>                  <P>Due to track maintenance at <STRONG>149 St-Grand Concourse</STRONG>, southbound [2] and [5] trains are running with delays.</P><P>Allow additional travel time.</P>                <br/><br/>"
      expect(StatusParser.find_start_time!(string)).to eq("2:03PM")
    end

    it "correctly finds a start time with two leading digits" do 
      string = "                    <span class='TitleServiceChange' >Service Change</span>                    <span class='DateStyle'>                    &nbsp;Posted:&nbsp;03/02/2015&nbsp; 10:01AM                    </span><br/><br/>                  <P>Due to a rail condition at <STRONG>Grant Av</STRONG>, the following service changes are in effect: </P><P>Southbound [A] trains are running with delays.</P><P>Some southbound [A] trains terminate at<STRONG> Euclid Av</STRONG>. </P><P>Allow additional travel time.</P>                <br/><br/>              "
      expect(StatusParser.find_start_time!(string)).to eq("10:01AM")
    end
  end
end
