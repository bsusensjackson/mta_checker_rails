class JSONParser 
  JSON_URL = 'http://www.mta.info/service_status_json'
  class << self
    def call
      @response = JSON.parse HTTParty.get(JSON_URL)
    end

    def find_status(name)
      @response['subway']['line'].select { |train| train['name'] == name }.first
    end
  end
end
