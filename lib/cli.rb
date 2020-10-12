#this will interact with the users
class Cli 
    def start
    puts "Welcome to anime search finder! (*^‿^*)"
     prompt_search
     prompts
     input = gets.strip.downcase
     while input != "exit" do 
       if input == "list"
             print_animes_list(Anime.find_by_anime(@anime_search))
             puts ""
       elsif input.to_i > 0 && input.to_i <= Anime.all.length
        anime_picked = Anime.find_by_anime(@anime_search)[input.to_i-1] 
        Api.get_anime_details(anime_picked)
        print_anime(anime_picked)
       elsif input == "search"
        prompt_search
       else
        puts "UNKNOWN option. Please re-enter a valid opition."
        puts ""
       end
       prompts
       input = gets.strip.downcase
     end
     puts "Thanks for searching! 	٩(｡•́‿•̀｡)۶ " 
    end

   
    def print_animes_list(an_f)   #putting in the your instance of animes_found
        puts "Here are your results of #{@anime_search}: "
        an_f.each_with_index do |a, i|
          puts "#{i+1}. #{a.name}"
        end
    end

    def print_anime (anime_picked)
      puts "~~~~~~~ ABOUT~~~~~~~~~~"
      puts "#{anime_picked.name} "
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "Japansese name: #{anime_picked.title_japansese}"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "Summary: #{anime_picked.synopsis}"
      puts "Episodes: #{anime_picked.episodes}"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "Status: #{anime_picked.status}"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "Rank among users: #{anime_picked.rank}"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts ""

    end

    def prompts
      puts "Type a number listed to see more details about the anime"
      puts "OR type 'list' to see the list again"
      puts "OR type 'search' to look for another anime"
      puts "OR type 'exit' to exit"
    end

    def prompt_search
      puts "Search for your favorite anime"
    puts ""
     @anime_search = gets.strip.downcase
     puts ""
     Api.fetch_show(@anime_search)
     puts ""
     animes_found = Anime.find_by_anime(@anime_search) 
     print_animes_list(animes_found)
    end
end

