#this will interact with the users
class Cli 
    def start
    puts "Welcome to anime search finder! (*^‿^*)"
    puts ""
    puts "Search for your favorite anime enter: search anime"
    puts ""
     @anime_search = gets.strip.downcase
     puts ""
     Api.fetch_show(@anime_search)
     puts ""
     animes_found = Anime.all  
     
     print_anime(animes_found)
     puts ""
     puts "Type a number listed to see more details about the anime you want,  tpye exit to exit, or type back to go back to the options"
     input = gets.strip.downcase
     while input != "exit" do 
        anime_picked = Anime.find_by_anime(@anime_search)[input.to_i-1]
        Api.get_anime_details(anime_picked)
    
     end
     puts "To look at your list of anime enter: my list"
     puts ""
     puts "Search by production company, enter: search production"
     puts ""
     puts "To exit, enter: exit "
    end

   
    def print_anime(an_f)   #putting in the your instance of animes_found
        puts "Here are your results of #{@anime_search}: "
        an_f.sort_by{|show| show.name}.map.with_index(1) do |a,i|
          puts "#{i}. #{a.name}"
        end
      
    end
end

