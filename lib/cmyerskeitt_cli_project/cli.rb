

class CmyerskeittCliProject::Cli 
  def start
    puts "Welcome to Christine's Word Genius CLI Gem!" 
    puts "This app is a quick way to explore the definitions, synonyms, rhymes, pronunciation, syllables, and frequency of usage for words."
    puts "What word would you like to explore today?"
    fetch_attributes(input= gets.chomp)

    # data= CmyerskeittCliProject::Api.new.fetch_data(input)
    # puts data.results 
  end

  def fetch_attributes(input)
  list=CmyerskeittCliProject::Api.new.fetch_data(input)
  binding.pry 
  list.collect do |attribute| 
   attribute["results"] 
  end 
 end 
 
end

