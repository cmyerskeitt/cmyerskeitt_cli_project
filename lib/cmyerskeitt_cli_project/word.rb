class CmyerskeittCliProject::Word
#class word 
 @@all =[]

attr_accessor :name, :results, :syllables,:pronunciation, :frequency 

    def initialize
        @@all<<self
    end

    def self.all
    @@all
    end 
      
end 

