class CmyerskeittCliProject::Word
# class word 
  
#   attr_accessor :name, :definition, :part_of_speech, :synonyms, :type_of, :has_types,:derivation, :examples, :syllables

#     @@all=[]

#   def initialize(word_hash)
#         @name= word[0]
#         self.send("definition=", word_hash[:definition}
#         self.send("part_of_Speech=", word_hash[:partOfSpeech]
#         self.send("synonyms=", word_hash[:synonyms]
#         self.send("type_of=", word_hash[:typeOf]
#         self.send("has_types=", word_hash[:hasTypes]
#         self.send("member_of=", word_hash[:member]
#         self.send("derivation=", word_hash[:derivation]   
#         self.send("examples=", word_hash[:examples]
#         self.send("syllables=", word_hash[:syllables]
#     end 

    def self.create_from_api(students_array)
        students_array.each do |word_hash| 
          Student.new(word_hash)
        end
      end

#     def self.all
#         @@all
#     end

  
end 

