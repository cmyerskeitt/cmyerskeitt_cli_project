
class CmyerskeittCliProject::Cli 
  
  def start
    input= ""
    while input != "exit app!"
    puts "Welcome to Christine's Word Genius CLI Gem!" 
    puts "This app is a quick way to explore the detailed definition, synonyms,  pronunciation, syllables, and frequency of  usage of English words."
    puts "What word would you like to explore today?"
    input=gets.chomp
    CmyerskeittCliProject::Api.new.fetch_data(input)
      


    if input == ""
      start
    elseif input == "exit app!"
      puts "Great job expanding your vocabulary, Genius!"
      exit
    else
      puts "Congratulations! You created a new word. Unfortunately, I dont have a definition for it. Please enter another word"
      start
    end 
    end 

    
  
    # puts "To get a gentle reminder of the word you entered, enter "name"."
    # puts "To get the detailed definition of your word, enter "definition"."
    # puts "To get the synonyms of your word, enter "synonyms"."
    # puts "To get the pronunciation of your word, enter "pronunciation"."
    # puts "To get the syllables of your word, enter "syllables"."
    # puts "To get the frequency of use for our word, enter "frequency"."
    # input=gets.chomp
    

  end

end 


