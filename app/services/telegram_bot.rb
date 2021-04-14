class TelegramBot
  class << self
    def send_msg(msg, chat_id, token)
      # token = "1328720022:AAFZxTo3k325Q6TzGUXv32FJuy46iUpcLO8"
      url = "https://api.telegram.org/bot#{token}/sendMessage"
      payloads = {'chat_id': chat_id, 'text': msg}
      res = HTTParty.post(url, 
        :headers => { 'Content-Type' => 'application/json' },
        body: payloads.to_json )
      result = JSON.parse(res.body)
      return result
    end
  end
end