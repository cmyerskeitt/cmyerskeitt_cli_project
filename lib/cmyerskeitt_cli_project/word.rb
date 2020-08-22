class CmyerskeittCliProject::Word
# goal: receive the information from word
# turn into attrubute in order to display on terminal


     @@all =[]
 attr_accessor :name, :definitions, :syllables,:pronunciation, :frequency

    def initialize(name,definitions,syllables,pronunciation,frequency)
        @name=name 
        @definitions=definitions 
        @syllables=syllables 
        @pronunciation=pronunciation
        @frequency=frequency 
        # t addbinding.pry
        @@all<<self
        
    end

    
    def self.all
        @@all
    end 

    
    
       

      
      
end 


