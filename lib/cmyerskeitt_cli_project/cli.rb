class CmyerskeittCliProject::Cli 
  
  def new_start 
    puts "Welcome to the Christine Myers Keitt's Word Genius CLI Gem!" 
    puts "This app is a quick way to explore the detailed definitions, pronunciation, syllables, and frequency of usage of English words."
    puts " " 
    puts "Here are 3 quick and easy Word Genius rules to live by:"
    puts " "
    puts "#1: Remember that each word can have more than one definition."
    sleep 1
    puts "#2: If you enter a word that does not exist the program will not return a value. I bet you already knew that though, Genius!"
    sleep 1
    puts "#3: Use this gem to have fun. Play Scrabble. Pick up a crossword. Write a poem. Who said being a Word Genius had to be boring?"
    sleep 1
    puts " "
    puts "Let's get started!"
    sleep 1
    puts "What word would you like to explore today?"
    start
  end

  def start 
    input= ""
    while input != "exit!" 
      input = gets.chomp
      CmyerskeittCliProject::Api.new.fetch_data(input)
      
      if input == ""    
       start
      elsif input == " "
      puts "Don't forget to type in a word. Let's take it from the top, Genius!"
      start
      else
        find_info(input)

      end 
    end 
  end 


  def find_info(word) 
    input=""
    while input != "exit!"
    puts " "
    puts 'To get a list of definitions for your word, enter "definitions".'
    puts 'To get the pronunciation of your word, enter "pronunciation".'
    puts 'To get the syllables of your word, enter "syllables".'
    puts 'To get the frequency of use, enter "frequency".'
    puts 'To look up another word, enter  "new".'
    puts 'If you would like to see a list of saved words, enter "genius".'
    puts 'To leave, type "exit!"'
    puts " "
    puts "What would you like to do?"
    input= gets.gsub(/\s+/, "").downcase 

      case input 
      when "definitions"
        #binding.pry 
        list_definitions(word)
      when "pronunciation"
       list_pronunciation(word)
      when "syllables"
        list_syllables(word)
      when "frequency"
         list_frequency(word)
      when "new"
        new_word 
      when "genius"
        puts " "
        list=CmyerskeittCliProject:: Word.all.collect {|word| word.name}.uniq
        puts list
        puts " "
        puts "Type in the word from the query above that you would you like to reexplore: "
        query_word= gets.chomp
        find_info(query_word)

      when "exit!"
        puts "You're definitely a word genius now. See you next time!"
        exit
      else
        puts "Type in a valid request from the list, genius!"
      end 
    end 
  end 

  

  def list_definitions(word) 
    puts " "
    puts "#{word.capitalize}"
    puts "DEFINITIONS:"
    #binding.pry
    #  definitions= []
    found = CmyerskeittCliProject::Word.all.find { |w| w.name == word }
    definition= found.definitions.map { |h| h["definition"]}
    
     
      definition.each.with_index(1) do |d, i|
        #binding.pry 
        puts "#{i} - #{d}"
      end
  end 


  def list_pronunciation(word) 
    # binding.pry
    say_it=CmyerskeittCliProject:: Word.all.find { |w| w.name == word }
    say_it.pronunciation
    # binding.pry 

    puts "PRONUNCIATION: #{say_it.pronunciation}"
  end 

  def list_syllables(word) 
    say_it=CmyerskeittCliProject:: Word.all.find { |w| w.name == word }
    say_it.syllables 
      puts "SYLLABLES: #{say_it.syllables}"

  end

  def list_frequency(word)
   say_it=CmyerskeittCliProject::Word.all.find { |w| w.name == word }
   say_it.frequency
      puts "FREQUENCY: #{say_it.frequency}"
      puts "Frequency is assesed on a scale of 1-7. 1 being low usage in the English language and 7 being high usage in the English language."
  end 


  def new_word 
    puts "What word would you like to explore today?"
    new_input= gets.chomp
    CmyerskeittCliProject::Api.new.fetch_data(new_input)
    if new_input == ""
      new_word
    elseif new_input == " "
      puts "Don't forget to type in a word. Let's take it from the top, Genius!"
      new_word
    else
      find_info(new_input)
    end 
  end 



end

