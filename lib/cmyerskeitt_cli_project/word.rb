class CmyerskeittCliProject::Word

    @@all =[] 

    attr_accessor :name, :definitions, :syllables,:pronunciation, :frequency

    def initialize(name,definitions,syllables,pronunciation,frequency) 
        @name=name 
        @definitions=definitions 
        @syllables=syllables 
        @pronunciation=pronunciation
        @frequency=frequency 
        # binding.pry
        save 
    end

    def save 
        @@all<< self
    end


    def self.all
        @@all
    end 
      
      
end 


