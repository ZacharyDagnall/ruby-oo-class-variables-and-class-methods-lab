require 'pry'

class Song
    attr_accessor :name, :artist, :genre
   
    @@names = []
    @@count =0
    @@artists = []
    @@genres = []
   # @@all = []
    @@genre_count = {}
    @@artist_count={}

    def initialize(name, artist, genre)
        @name = name
        @@names.push(@name) #unless @@names.include?(@name)
            #why shouldn't i just check for uniqueness now? What advantage is there to having an array with duplicate artists/names/genres? I thought this would be more efficient (better code design) than ".uniq"-ing my arrays later on, but the tests don't allow for that.
        @artist = artist
        @@artists.push(@artist) #unless @@artists.include?(@artist)
        if @@artist_count[@artist]
            @@artist_count[@artist]+=1
        else
            @@artist_count[@artist]=1
        end 
        @genre = genre
        @@genres.push(@genre) #unless @@genres.include?(@genre)
        if @@genre_count[@genre]
            @@genre_count[@genre]+=1
        else
            @@genre_count[@genre]=1
        end
        #@@all << self       
        #never ended up using this^ but i meant to store everything in here and access the different attributes (artist, genre, name) in the appropriate methods. It seems advantageous to store whole objects as opposed to having a separate array for each characteristic. But the tests prefer individual arrays.
        @@count += 1
        self
    end

    def self.count
        @@count
    end

    def self.artists
        @@artists.uniq
    end

    def self.genres
        @@genres.uniq 
    end

    def self.genre_count
        @@genre_count
    end

    def self.artist_count
        @@artist_count
    end

end