class TrainNotifier
  attr_accessor :trains
  def initialize(json_parser)
    @status_hash = json_parser.parse
    @trains = Train.all
  end

  def evaluate! #TODO- Refactor Me
    @status_hash['subway']['line'].each do |item|
      @trains.each do |train|
        if train.name == item['name'] 
          if item['status'] == 'DELAYS' && train.current_outage == false
            train.set_current_outage = true
          elsif item['status'] == 'GOOD SERVICE' && train.current_outage == true
            train.set_current_outage = false
          end
        end
      end 
    end 
  end
end
