class TrainNotifier
  attr_accessor :trains
  attr_reader :status_hash
  
  def initialize(json_parser)
    @status_hash = json_parser.parse
    @trains = Train.all
  end

  def evaluate! #TODO- Refactor Me
    @status_hash['subway']['line'].each do |item|
      @trains.each do |train|
        if train.name == item['name'] 
          if item['status'] == 'DELAYS' && train.current_outage == false
            change_train_status(train)
          elsif item['status'] == 'GOOD SERVICE' && train.current_outage == true
            change_train_status(train)
          end
        end
      end 
    end 
  end

  def change_train_status(train)
    current = train.current_outage
    train.set_current_outage = !current
    train.save
  end
end
