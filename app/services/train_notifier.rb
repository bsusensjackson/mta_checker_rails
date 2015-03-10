class TrainNotifier
  OUTAGES = {
    "GOOD SERVICE" => false,
    "DELAYS" => true
  }

  def initialize(json_parser, status_parser)
    @status_hash = json_parser.parse
    @status_parser = status_parser
  end

  def evaluate! #TODO- Refactor Me

  #TRAINs with current outage - 
    #IF TRAIN is no longer delayed
    #CHANGE TRAIN STATUS to !delayed
  #TRAINS with no outage
    #IF TRAIN is delayed
    #CHANGE TRAIN STATUS to delayed
  
    @status_hash['subway']['line'].each do |line|
      trains = break_up_text(line['name'])
      
      trains.each do |line| 
        t = find_train(line)
        notify_train(t) { t.outage? == OUTAGES[line['status']] }
      end
    end
  end

  private 

  attr_reader :status_parser, :status_hash
 
  def find_train(line)
    Train.first_or_create(name: line)
  end

  def notify_train(train, &block)
    change_train_status train if yield
  end

  def change_train_status(train)
    train.set_current_outage(!train.outage?)
    train.save
  end

  def break_up_text(string)
    ar = string.split("")
  end 
end
