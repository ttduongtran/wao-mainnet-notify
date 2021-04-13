class Moniker < ApplicationRecord
  after_save :set_default_status
  
  enum moniker_type:{
    "BTC_ETH": 0,
    "BTC_BSC": 1
  }

  enum status:{
    "Offline": 0,
    "Online": 1
  }


  def set_default_status
    self.status = 1 unless self.status.nil?
  end

end
