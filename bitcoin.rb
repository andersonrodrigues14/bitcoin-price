require 'net/http'
require 'json'
require 'pry'

class Bitcoin
    def initialize(url)
        @url = url
    end

    def actual_price
        loop do 
            puts "O preço atual do Bitcon em dólar é $#{fetch_bitcoin_price}"
            sleep 4
        end
    end

    private
    def fetch_bitcoin_price
        url = URI(@url)
        response = Net::HTTP.get(url)
        data = JSON.parse(response)

        return data['bpi']['USD']['rate']
    end
end

Bitcoin.new("https://api.coindesk.com/v1/bpi/currentprice/BTC.json").actual_price