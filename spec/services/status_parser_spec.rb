def find_trains!(string) 
  chars = string.split("")
  trains = []
  chars.each_with_index do |char, i|
    trains << chars[i+1].to_i if char == '['
  end
  trains
end

RSpec.describe "StatusIdentifier" do 
  it "correctly cleans away any markup" do 
    string = "<span class='TitleDelay'>Delays</span>                    <span class='DateStyle'>                    &nbsp;Posted:&nbsp;03/02/2015&nbsp; 2:03PM                    </span><br/><br/>                  <P>Due to track maintenance at <STRONG>149 St-Grand Concourse</STRONG>, southbound [2] and [5] trains are running with delays.</P><P>Allow additional travel time.</P>                <br/><br/>"
    trains = find_trains!(string)
    expect(trains).to eq([2, 5])
  end
end
