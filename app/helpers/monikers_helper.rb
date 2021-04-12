module MonikersHelper
  require 'httparty'

  def fetch_mainnet_api(uri)
    response = HTTParty.get(uri)
    data = JSON.parse(response.body)
    mainnet_data = []
    
    data.each do |item|
      mainnet_data.append(item['moniker'].downcase)
    end

    return mainnet_data
  end
  # uri = "https://btc-wbtc-mainnet.quantexe.com/api/v1/peers"

  def mainnet_perform(data, uri)
    monikers_missing = []
    response = []
    data_api = fetch_mainnet_api(uri)
    
    data.each do |moni|
      if !data_api.include? moni.name.downcase
        monikers_missing.append(moni)
        response.append(moni.name)
      end
    end

    if monikers_missing.nil?
      puts "Nothing"
    else
      puts "Sending notice monikers_missing to telegram"
      monikers_missing.each do |mm|
        NotifyLog.create!({
          moniker_id: mm.id,
          name: mm.name
        })
      end
    end

    return response
  end

  def parse_to_message(items)
    rs = ""
    if items.present?
      items.each do |item|
        rs += item.to_s + ", "
      end
    end
    
    return rs.delete_suffix(", ") + " are offline" if rs.present? 

  end
  
end
