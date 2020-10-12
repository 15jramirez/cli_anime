class Anime
    attr_accessor :name, :anime_id, :anime_search, :title_japansese, :rank, :synopsis, :episodes, :status
    @@all =[]

    def initialize(name:, anime_id:, anime_search:)
        @name = name 
        @anime_id = anime_id
        @@all << self
        @anime_search = anime_search
    end

    def self.all
        @@all
    end

    def self.find_by_anime(anime_search)
        @@all.sort{|a, b| a.name <=> b.name}.select{|a| 
            a.anime_search == anime_search}
        
    end
end
