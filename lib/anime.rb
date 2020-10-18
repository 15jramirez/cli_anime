class Anime
    attr_accessor :name, :anime_id, :anime_search, :title_japansese, :rank, :synopsis, :episodes, :status, :api
    @@all =[]

    def initialize(name:, anime_id:, anime_search:)
        @name = name 
        @anime_id = anime_id
        @anime_search = anime_search
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sort_list(list)
            list.sort{|a, b| a.name <=> b.name}
        end

    def self.find_by_anime(anime_search)
        animes = sort_list(@@all.select{|a| 
            a.anime_search == anime_search})

        if animes.empty?
            @apis_animes = Api.new(anime_search)
            animes = sort_list(@apis_animes.fetch_show(anime_search))
        end
        animes
    end

    def self.picked(anime_picked)
        @apis_animes.get_anime_details (anime_picked)
    end
end
