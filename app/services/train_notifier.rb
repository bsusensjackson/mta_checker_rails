class TrainNotifier
  attr_accessor :trains
  def initialize(json_parser)
    @status_hash = json_parser.parse
    @trains = Train.all
  end

  def evaluate! #TODO- This is extremely naive.  Evaluate choice of data structure here. 
    @status_hash['subway']['line'].each do |item|
      @trains.each do |train|
        if train.name == item['name'] 
          if item['status'] == 'DELAYS'
            train.current_outage = true
          end
        end
      end 
    end 
  end
end
