class JSONParser 
  def initialize(http_wrapper)
    @http_wrapper = http_wrapper 
  end

  def parse
    @response = JSON.parse(@http_wrapper.call)  
  end

  def find_status(name)
    @response['subway']['line'].select { |train| train['name'] == name }.first
  end
end
