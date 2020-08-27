require 'uri' #uniform handling of handling URIs
require 'net/http' #provides a rich library which can be used to build HTTP user-agents
require 'openssl' #OpenSSL provides SSL, TLS and general purpose cryptography.
require 'pry' #debug w/o IRB 
require "json" #format data from Api 
require 'rest-client' #a simple HTTP and REST client for Ruby, inspired by the Sinatra’s microframework style of specifying actions: get, put, post, delete.” Like HTTParty, it’s also built upon net/http. Unlike HTTParty, you’ll still need the JSON  library to parse the response.

class CmyerskeittCliProject::Api

    def fetch_data(word) #fetches Api data for word passed through as argument and sends data to Word class 
    url = URI("https://wordsapiv1.p.rapidapi.com/words/#{word}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'wordsapiv1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'b48d7cc02cmsh92e80d060116fa8p103d07jsn1e37841644b3'

    response = http.request(request)

    data = JSON.parse(response.read_body)
        # binding.pry
        if data["success"] == false  #error handling for Non-English word 
            puts "This is not a valid input. Please enter a English word."
            CmyerskeittCliProject::Cli.new.start
        else 
            if data["word"] != nil #conditional statements to erroe handle for missing data/nil
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
#  puts data 