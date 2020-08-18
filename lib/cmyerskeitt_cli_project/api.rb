require 'uri'
require 'net/http'
require 'openssl'
require 'pry'

# class CmyerskeittCliProject::Api
    class Api
        
    def fetch_data
   
    url = URI("https://us-doctors-and-medical-professionals.p.rapidapi.com/search_npi?npi=1033112214")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Get.new(url)
    binding.pry 
    request["x-rapidapi-host"] = 'us-doctors-and-medical-professionals.p.rapidapi.com'
    request["x-rapidapi-key"] = 'b48d7cc02cmsh92e80d060116fa8p103d07jsn1e37841644b3'
    
    response = http.request(request)
    puts response.read_body
    end 
end 
# Api.new.fetch_data I have to make a call like this in order to run an individual file.