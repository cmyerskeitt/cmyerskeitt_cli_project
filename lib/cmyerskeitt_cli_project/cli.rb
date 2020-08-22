#If a person puts in a wrong word they get black a blank line for information? Is this ok? 
#when listing the definitions how to I get rid of the brackets when listing?
#when listing definitions is there a way to print a line in between each index?
#How do I produce a list fromthe words previously passed into program?

class CmyerskeittCliProject::Cli 
  
  def start
    input= ""
    puts "Welcome to the 2020 Word Genius CLI Gem!" 
    sleep 2
    puts "This app is a quick way to explore the detailed definitions, synonyms,  pronunciation, syllables, and frequency of usage of English words."
    sleep 2
    puts "Here are 3 quick and easy Word Genius rules to live by:"
    sleep 2
    puts "#1: Genius's always remember that each word can have more than one definition."
    sleep 1
    puts "#2: If you enter a word that does not exist the program will not return a value. I bet you already knew that though, Genius!"
    sleep 1
    puts "#3: Have fun. Play Scrabble. Pick up a crossword. Write a poem. Who said being a Word Genius had to be boring?"
    sleep 1
    puts "Let's get started!"
    sleep 1
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
    puts 'To get a list of definitions for your word, enter "definitions".'
    puts 'To get the pronunciation of your word, enter "pronunciation".'
    puts 'To get the syllables of youer word, enter "syllables".'
    puts 'To get the frequency of use, enter "frequency".'
    puts 'To leave, type "exit app!"'
    puts "What would you like to do?"
    input=gets.chomp 

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
      else
        puts "Type in a valid request from the list, genius!"
      end 
    end 
  end 

  

  def list_definitions
     definitions= CmyerskeittCliProject:: Word.all.collect {|word| word.definitions}
     if definitions == nil 
      puts "No value found."
    else
      puts definitions
    end
  end 


  def list_pronunciation
    pronunciation= CmyerskeittCliProject:: Word.all.collect {|word| word.pronunciation}
    if pronunciation == nil 
      puts "No value found."
    else
      puts pronunciation
    end
  end 

  def list_syllables
    syllables= CmyerskeittCliProject:: Word.all.collect {|word| word.syllables}
    if syllables == nil 
      puts "No value found."
    else
      puts syllables
    end
  end

  def list_frequency 
    frequency=CmyerskeittCliProject:: Word.all.collect {|word| word.frequency}
    if frequency == nil 
      puts "No value found."
    else
      puts frequency
    end
    
  end 

end 


  




