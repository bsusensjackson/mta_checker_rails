class Train < ActiveRecord::Base
  has_many :service_outages
  LINES = %w(456, ACE, 123, 7, BDFM, G, JZ, L, NQR, S)
  attr_reader :current_outage
  def outage?
    self.current_outage
  end

  def set_current_outage(status)
    self.current_outage = status
  end

  def create_current_outage
    @current_outage = ServiceOutage.create(train_id: self.id, outage_start: Chronic.parse('now'))
  end

  def end_current_outage
    @current_outage.outage_end = Chronic.parse('now')
  end
end
