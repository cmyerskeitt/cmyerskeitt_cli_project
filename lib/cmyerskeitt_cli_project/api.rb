addrequire 'uri'
require 'net/http'
require 'openssl' 
require 'pry'
require "json" 
require 'rest-client' 

class CmyerskeittCliProject::Api

    def fetch_data(word) 
    url = URI("https://wordsapiv1.p.rapidapi.com/words/#{word}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'wordsapiv1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'b48d7cc02cmsh92e80d060116fa8p103d07jsn1e37841644b3'

    response = http.request(request)

    data = JSON.parse(response.read_body)
         #binding.pry
        if data["success"] == false  
            puts "This is not a valid input. Please enter an English word."
            CmyerskeittCliProject::Cli.new.start
        else 
            if data["word"] != nil 
                name = data["word"]
            end 
            if data["results"] != nil
                definitions = data["results"]
            end 
            if data["syllables"]!= nil 
                syllables = data["syllables"]["count"]
            end 
            if data["pronunciation"]!= nil
                pronunciation = data["pronunciation"]["all"]
            end 
            if data["frequency"] != nil
                frequency = data["frequency"]
            end 
            #  binding.pry 
            word = CmyerskeittCliProject::Word.new(name, definitions, syllables, pronunciation,frequency) 
        end
        # binding.pry 
    end   
end 
     
#  data= Api.new.fetch_data("apple")
