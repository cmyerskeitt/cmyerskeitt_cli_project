

class CmyerskeittCliProject::Cli 
  def start
    input= ""
    while input != "exit app!"
    puts "Welcome to Christine's Word Genius CLI Gem!" 
    puts "This app is a quick way to explore the definitions, synonyms, rhymes, pronunciation, syllables, and frequency of usage for words."
    puts "What word would you like to explore today?"
    input=gets.chomp
    CmyerskeittCliProject::Api.new.fetch_data(input)
    puts "Would information about this word would you like to explore?"
      


    
    input= gets.chomp
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
  end


end

