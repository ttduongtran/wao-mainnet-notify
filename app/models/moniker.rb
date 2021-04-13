class Moniker < ApplicationRecord
  after_save :set_default_status
  
  enum moniker_type:{
    "btc_eth": 0,
    "btc_bsc": 1
  }

  enum status:{
    "offline": 0,
    "online": 1
  }


  def set_default_status
    self.status = 1 unless self.status.nil?
  end

end
