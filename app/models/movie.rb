class Movie < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites

    def favorites
        Favorite.all.select {|fav_movies| fav_movies.movie == self}
    end

    def users
        self.favorites.map do |fav_list|
            fav_list.user
        end
    end
end