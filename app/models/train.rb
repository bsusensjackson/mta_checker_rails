class Train < ActiveRecord::Base
  has_many :service_outages
  LINES = ['456', 'ACE']
  
  class << self
    def look_for_service_status!
      JSONParser.call
      LINES.each do |line|
        response = JSONParser.find_status(line)
        
        t = Train.find_or_create_by(name: line)
        t.search(response)
      end
    end
  end
  
 def search(response)
    if response['status'] == 'DELAYS'
      s = ServiceOutage.find_or_create_by(train_id: self.id)
      if self.outage?
        #Blah blah 
      else
        s.outage_start = Chronic.parse('now')
        self.set_outage(true)
      end
    end 
  end

 def outage?
   self.current_outage
 end

 def set_outage(status)
   self.current_outage = status
 end
end
