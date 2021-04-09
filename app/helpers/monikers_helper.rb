module MonikersHelper
  require 'httparty'

  def fetch_mainnet_api(uri)
    response = HTTParty.get(uri)
    data = JSON.parse(response.body)
    mainnet_data = []
    
    data.each do |item|
      mainnet_data.append(item['moniker'].downcase)
    end
  end

  def mainnet_perform(data_db, uri)
    monikers_missing = []
    data_api = fetch_mainnet_api(uri)

    data_db.each do |moni|
      if !data_api.include? moni.name.downcase
        monikers_missing.append(moni)
      end
    end

    if monikers_missing.nil?
      puts "Nothing"
    else
      puts "Sending notice monikers_missing"
      monikers_missing.each do |mm|
        NotifyLog.create!({
          moniker_id: mm.id,
          name: mm.name
        })
      end
    end
  end
  
end
