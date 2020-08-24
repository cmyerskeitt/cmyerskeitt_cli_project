require 'uri'
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
        name = data["word"]
        definitions= data["results"]
        syllables= data["syllables"]["count"]
        pronunciation= data["pronunciation"]["all"]
        frequency= data["frequency"]
        # binding.pry 
        word = CmyerskeittCliProject::Word.new(name, definitions, syllables, pronunciation,frequency) 
        
    end   
end 
     
#  data= Api.new.fetch_data("apple")
#  puts data 
   
    #  hash["new_key"] = "New Value".


    # {"word"=>"apple",
    #     "results"=>
    #      [{"definition"=>
    #         "native Eurasian tree widely cultivated in many varieties for its firm rounded edible fruits",
    #        "partOfSpeech"=>"noun",
    #        "synonyms"=>["malus pumila", "orchard apple tree"],
    #        "typeOf"=>["apple tree"],
    #        "memberOf"=>["malus", "genus malus"]},
    #       {"definition"=>
    #         "fruit with red or yellow or green skin and sweet to tart crisp whitish flesh",
    #        "partOfSpeech"=>"noun",
    #        "typeOf"=>["pome", "false fruit", "edible fruit"],
    #        "hasTypes"=>