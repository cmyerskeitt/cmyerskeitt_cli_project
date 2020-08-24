#If a person puts in a wrong word they get black a blank line for information? Is this ok? 
#when listing the definitions how to I get rid of the brackets when listing?
#How do I produce a list from the words previously passed into program?
#I need to account for whitespace when user enters input

class CmyerskeittCliProject::Cli 
  
  def start
    puts "Welcome to the 2020 Word Genius CLI Gem!" 
    # sleep 2
    puts "This app is a quick way to explore the detailed definitions, synonyms,  pronunciation, syllables, and frequency of usage of English words."
    # sleep 2
    puts " " 
    puts "Here are 3 quick and easy Word Genius rules to live by:"
    # sleep 2
    puts "#1: Remember that each word can have more than one definition."
    # sleep 1
    puts "#2: If you enter a word that does not exist the program will not return a value. I bet you already knew that though, Genius!"
    # sleep 1
    puts "#3: Use this gem to have fun. Play Scrabble. Pick up a crossword. Write a poem. Who said being a Word Genius had to be boring?"
    # sleep 1
    puts " "
    puts "Let's get started!"
    # sleep 1
    puts "What word would you like to explore today?"
    input=gets.chomp
    CmyerskeittCliProject::Api.new.fetch_data(input)
    if input == ""
       start
    elseif input == " "
      puts "Don't forget to type in a word. Let's take it from the top, Genius!"
      start
    else
        find_info
    end 
  end 


  def find_info
    input=""
    while input != "exit app!"
    puts " "
    puts 'To get a list of definitions for your word, enter "definitions".'
    puts 'To get the pronunciation of your word, enter "pronunciation".'
    puts 'To get the syllables of youer word, enter "syllables".'
    puts 'To get the frequency of use, enter "frequency".'
    puts 'To look up another word, enter  "start".'
    puts 'If you would like to see a list of saved words, enter "genius".'
    puts 'To leave, type "exit!"'
    puts " "
    puts "What would you like to do?"
    input= gets.gsub(/\s+/, "")

      case input
      when "definitions"
        self.list_definitions
        # How can I get these to print out with a space in between each definition?
      when "pronunciation"
        self.list_pronunciation
      when "syllables"
        self.list_syllables
      when "frequency"
         self.list_frequency
      when "start"
        new_word 
      when "genius"
          self.list_saved_words
      when "exit!"
        puts "You're definitely a word genius now. See you next time!"
        exit
      else
        puts "Type in a valid request from the list, genius!"
      end 
    end 
  end 

  

  def list_definitions
     definitions= []
      CmyerskeittCliProject:: Word.all.collect do |word|
        word.definitions.each do |h|
          definitions << h["definition"]
        end
      end

      definitions.each.with_index(1) do |d, i|
        puts "#{i} - #{d}"
        # puts d 
       
      end
   
     
  
    
  end 


  def list_pronunciation
    pronunciation= CmyerskeittCliProject:: Word.all.collect {|word| word.pronunciation}
    puts "PRONUNCIATION: #{pronunciation.first}"
  end 

  def list_syllables
    syllables= CmyerskeittCliProject:: Word.all.collect {|word| word.syllables}
      puts "SYLLABLES: #{syllables.first}"
  end

  def list_frequency 
    frequency=CmyerskeittCliProject::Word.all.collect {|word| word.frequency}
      puts "FREQUENCY: #{frequency.first}"
  end 

  def list_saved_words
    list=CmyerskeittCliProject:: Word.all.collect {|word| word.name}
    puts "Which word from the query would you like to reexplore: "
    puts list
    puts " "
    puts "What word would you like to explore today?"
    query_word= gets.chomp
    puts " "
    puts 'To get a list of definitions for your word, enter "definitions".'
    puts 'To get the pronunciation of your word, enter "pronunciation".'
    puts 'To get the syllables of youer word, enter "syllables".'
    puts 'To get the frequency of use, enter "frequency".'
    puts 'To look up another word, enter  "start".'
    puts 'If you would like to see a list of saved words, enter "genius".'
    puts 'To leave, type "exit!"'
    puts " "

    case query_word 
    while query_word != "exit!"
    when "definitions"
    #     go into self.all and get definition
    when "pronunciation"
    #     got into self.all and get 
    when "syllables"
    #     got into self.all and get 
    when "frequency"
    #     got into self.all and get 
    when "start"
       new_word 
    when "genius"
      self.list_saved_words
    when "exit!"
      puts "You're definitely a word genius now. See you next time!"
      exit
    else
      puts "Type in a valid request from the list, genius!"
    end 
    
  end 
  


  def new_word 
    puts " "
    puts "What word would you like to explore today?"
    input=gets.chomp
    CmyerskeittCliProject::Api.new.fetch_data(input)
    if input == ""
      start
    elseif input == " "
      puts "Don't forget to type in a word. Let's take it from the top, Genius!"
      new_word
    else
      find_info
    end 
  end 
end

