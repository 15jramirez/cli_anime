#this will interact with the users
class Cli 
    def start
    puts "Welcome to anime search finder! (*^‿^*)"
     prompt_search
     prompts
     input = gets.strip.downcase
     while input != "exit" do 
       if input == "list"
             #  print_anime(anime_picked)
       elsif input.to_i > 0 && input.to_i <= Anime.all.length
        anime_picked = Anime.sort_results[input.to_i-1] 
        Api.get_anime_details(anime_picked)
        print_anime(anime_picked)
       elsif input == "search"
        prompt_search
       else
        puts "UNKNOWN option. Please re-enter a valid opition."
       end
       prompts
       input = gets.strip.downcase
     end
     puts "Thanks for searching! 	٩(｡•́‿•̀｡)۶ " 
    end

   
    def print_animes(an_f)   #putting in the your instance of animes_found
        puts "Here are your results of #{@anime_search}: "
        an_f.sort_by{|show| show.name}.map.with_index(1) do |a,i|
          puts "#{i}. #{a.name}"
        end
    end

    def print_anime (anime_picked)
      puts ""
      puts "(　･ω･)☞ #{anime_picked.name} About:"
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
      puts "Search for your favorite anime enter: search anime"
    puts ""
     @anime_search = gets.strip.downcase
     puts ""
     Api.fetch_show(@anime_search)
     puts ""
     binding.pry
     animes_found = Anime.all   #maybe use this instance but put in a new class.   
     print_animes(animes_found)
    end
end

