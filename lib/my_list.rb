class My_list
    attr_accessor :anime 
    @@all = []
    def initialize
        @@all << self 
    end

    def self.all 
        @@all 
    end
end