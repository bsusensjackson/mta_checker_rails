class StatusParser
  def self.find_start_time!(string)
    string.scan(/\d{1,2}:\d{2}../).join  
  end
  
  def self.find_trains!(string) 
    chars = string.split("")
    trains = []
    chars.each_with_index do |char, i|
      trains << chars[i+1] if char == '['
    end
    trains.uniq
  end
end
