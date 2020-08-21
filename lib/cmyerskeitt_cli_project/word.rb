class CmyerskeittCliProject::Word
# goal: receive the information from word
# turn into attrubute in order to display on terminal


     @@all =[]
 attr_accessor :name, :results, :syllables,:pronunciation, :frequency

    def initialize(name,results, syllables, pronunication,frequency)
        @name=name 
        @results=results 
        @syllables=syllables 
        @pronunciation=pronunciation
        @frequency= frequency 
        @@all<<self
        binding.pry 
    end

    

    def self.all
        @@all
    end 

    
      
end 


