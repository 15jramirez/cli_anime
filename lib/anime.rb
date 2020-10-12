class Anime
    attr_accessor :name, :anime_id, :anime_search, :results, :title_japansese, :rank, :synopsis, :episodes, :status
    @@all =[]

    def initialize(name:, anime_id:, anime_search:, results:)
        @name = name 
        @anime_id = anime_id
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sort_results
        @@all.sort_by{|show| show.name}
    end
    # def self.find_by_anime(chosen_anime)
    #     @anime_picked = chosen_anime
    #    sort_results.select{ |a| a.anime_picked == anime_chosen}
    # end

    # def about (anime_picked)
    #   anime_picked
    #  binding.pry
    # end


end
