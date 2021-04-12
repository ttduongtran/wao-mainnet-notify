require 'uri'

Redis.exists_returns_integer =  true

uri = URI.parse(ENV["REDIS_URL"])
REDIS = Redis.new(:url => uri)