#this will do all the gets needed
class Api 
    def self.fetch_show(anime_search)
         url = "https://api.jikan.moe/v3/search/anime?q=#{anime_search}"
         uri = URI(url)  #get the uri from where we get the net; 
         response = Net::HTTP.get(uri)
         anime_results = JSON.parse(response)["results"]
         anime_results.each do |showings|
           Anime.new(name:showings["title"], anime_id:showings["mal_id"],anime_search:anime_search)
         end
    end

    def self.get_anime_details(anime_picked)
        url = "https://api.jikan.moe/v3/anime/#{anime_picked.anime_id}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
         data = JSON.parse(response)
         anime_picked.synopsis = data["synopsis"]
         anime_picked.title_japansese = data["title_japanese"]
         anime_picked.rank = data["rank"] 
         anime_picked.episodes = data["episodes"]
         anime_picked.status = data["status"]
        
    end
end