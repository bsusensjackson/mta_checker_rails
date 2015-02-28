class JSONParser 
  class << self
    def call
      @response =JSON.parse HTTParty.get('http://www.mta.info/service_status_json')
    end

    def find_status(name)
      @response['subway']['line'].select { |train| train['name'] == name }
    end

    
  end
end
