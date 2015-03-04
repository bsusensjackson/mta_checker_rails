class TimeWrapper
  def current
    Chronic.parse('now')
  end    
end
