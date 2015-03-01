class HttpWrapper
  MTA_URL = 'http://www.mta.info/service_status_json'
  attr_reader :url 
  def initialize(options = {})
    @url = options.fetch(:url, MTA_URL)
  end

  def call
    HTTParty.get(@url)  
  end
end
