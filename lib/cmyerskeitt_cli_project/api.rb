require 'uri'
require 'net/http'
require 'openssl'
require 'pry'

# class CmyerskeittCliProject::Api
class Api

    def fetch_data(word)
    url = URI("https://wordsapiv1.p.rapidapi.com/words/#{word}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE


    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'wordsapiv1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'b48d7cc02cmsh92e80d060116fa8p103d07jsn1e37841644b3'

    response = http.request(request)
   
    puts response.read_body  
    end 
   
     
end 
       data= Api.new.fetch_data("apple")
        puts data 
   
