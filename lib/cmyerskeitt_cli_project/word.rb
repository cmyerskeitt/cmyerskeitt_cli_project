class CmyerskeittCliProject::Word
    attr_accessor :name, :definition, :part_of_speech, :synonyms, :type_of, :has_types,

    # @@all=[]

    def initialize(word_hash)
        @name= word[0]
        self.send ("definition=", results[:definition}
        self.send ("part_of_Speech=", results[:partOfSpeech]
        self.send ("synonyms=", results[:synonyms]
        self.send ("type_of=", results[:typeOf]
        self.send ("has_types=", results[:hasTypes]
        self.send ("member_of=", results[:member]
        self.send ("derivation=", results[:derivation]   
        self.send ("examples=", results[:examples]
        self.send ("syllables=", syllables[:count]
    end 

  
end 