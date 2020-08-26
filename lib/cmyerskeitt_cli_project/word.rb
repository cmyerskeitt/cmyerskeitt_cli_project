class CmyerskeittCliProject::Word #Word class to create instances of each word pulled from Api 

    @@all =[] #array of all word data saved 

    attr_accessor :name, :definitions, :syllables,:pronunciation, :frequency

    def initialize(name,definitions,syllables,pronunciation,frequency) #must initialize with attributes to access data in Word class 
        @name=name 
        @definitions=definitions 
        @syllables=syllables 
        @pronunciation=pronunciation
        @frequency=frequency 
        # binding.pry
        save 
    end

    def save #saves word data into @@all
        @@all<< self
    end


    def self.all #accesses @@all/saved word data
        @@all
    end 
      
      
end 


