
class CmyerskeittCliProject::Cli 
  
  def start
    input= ""
    puts "Welcome to Christine's Word Genius CLI Gem!" 
    puts "This app is a quick way to explore the detailed definition, synonyms,  pronunciation, syllables, and frequency of  usage of English words."
    puts "What word would you like to explore today?"
    input=gets.chomp
    CmyerskeittCliProject::Api.new.fetch_data(input)
    if input == ""
       start
    elseif input == "exit app!"
      puts "Great job expanding your vocabulary, Genius! See you next time."
      exit
    else
        find_info
    end 
  end 

  def find_info
    filter=""
    while filter != "exit app!"
    puts 'To get a gentle reminder of the word you entered, enter "name".'
    puts 'To get detailed definitions of your word, enter "definitions".'
    puts 'To get the synonyms of your word, enter "synonyms".'
    puts 'To get the pronunciation of your word, enter "pronunciation".'
    puts 'To get the syllables of your word, enter "syllables".'
    puts 'To get the frequency of use for our word, enter "frequency".'
    puts 'To leave, type "exit app!"'
    puts "What would you like to do?"
    filter=gets.chomp 

      case input
      when "name"
        self.list_name
      when "definitions"
        self.list_results
      when "synonyms"
        self.synonyms
      when "pronunciation"
        self.pronunciation
      when "syllables"
        self.syllables
      when "frequency"
        self.frequency
      else
        "Type ina vaild request please"
      end 
    end 
  end 



end 
  
   
    

  




