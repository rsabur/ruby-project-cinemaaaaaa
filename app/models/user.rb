class User < ActiveRecord::Base
    has_many :favorites
    has_many :movies, through: :favorites 

    attr_reader :name, :username, :password

    def self.login_helper_method
        puts "What is your username?"
        username = STDIN.gets.chomp
        puts "What is your password?"
        pass = STDIN.gets.chomp
        user_inst = User.find_by(username: username, password: pass)

         until user_inst
        #     sleep 1
            system 'clear'
             puts "Incorrect username or password"
             user_inst = User.login_helper_method
         end

        user_inst
    end

    def self.register_helper_method
        puts "What is your name?"
        name = STDIN.gets.chomp
        puts "What is your username?"
        username = STDIN.gets.chomp
        puts "What is your password?"
        pass = STDIN.gets.chomp
        user_inst = User.create(username: username, password: pass)
    end

    def display_movies
        system 'clear'
        sleep 1
        if movies.length > 0
            array_of_hashes = Movie.all.map do |movie|
                movie.title
            end.uniq
            movie_title = TTY::Prompt.new.select("Which movie would you like more information on?", array_of_hashes)
            puts "You chose #{movie_title}!"
            puts "---------------------------------"
            puts "#{movie_title}"
            puts "\n"
            puts "#{Movie.find_by(title: movie_title).description}"
            puts "\n"
            puts "Genre: #{Movie.find_by(title: movie_title).genre}"
            puts "\n"
            puts "Tomatometer: #{Movie.find_by(title: movie_title).rotten_tomatoes_review}"
            puts "\n"
            Movie.find_by(title: movie_title)
        else
            puts "No movies to display 😫"
            sleep 4
        end
    end

    def display_favorite_movies
        self.reload
        system 'clear'
        sleep 1
        if favorites.length > 0
            array_of_hashes = self.movies.map do |movie|
                # binding.pry
                movie.title
            end.uniq
            movie_title = TTY::Prompt.new.select("Which movie would you like more information on?", array_of_hashes)
            # binding.pry
            puts "You chose #{movie_title}!"
            puts "---------------------------------"
            puts "#{movie_title}"
            puts "\n"
            puts "#{Movie.find_by(title: movie_title).description}"
            puts "\n"
            puts "Genre: #{Movie.find_by(title: movie_title).genre}"
            puts "\n"
            puts "Tomatometer: #{Movie.find_by(title: movie_title).rotten_tomatoes_review}"
            puts "\n"
            # binding.pry
            puts "My Review: #{Favorite.find_by(movie_id: Movie.find_by(title: movie_title)).user_review}"
            puts "\n"
            Movie.find_by(title: movie_title)
        else
        puts "You don't have any movies listed 😫"
        sleep 2
        end
    end

    def add_review(fav_movie_review)
        if favorites.length > 0
            puts "What did you think of this movie?"
            comment = STDIN.gets.chomp
        # binding.pry
            self.favorites.find_by(movie_id: fav_movie_review.id).update(user_review: comment)
            puts "\n"
            puts "Thanks for reviewing!"
            sleep 4
        else
            puts "\n" 
            puts "You don't have any movies to review 🥺"
            puts "\n" 
            puts "To review, add a movie to your Favorite's List."
            sleep 3
        end
    end

    def add_new_favs
        system 'clear'
        sleep 1
        puts "Under Construction... 🚧🛠"
        sleep 1
        # binding.pry
        puts "Which movies would you like to add?"
        # binding.pry
        movie_choices = Movie.all.map {|movie| movie.title}.uniq
        new_favorite_list = TTY::Prompt.new.multi_select("Select movies:", movie_choices)
        # binding.pry
        
        new_favorite_list.each do |favorite| 
            # binding.pry 
            new_fav = Movie.find_by(title: favorite)
            Favorite.create(movie_id: new_fav.id, user_id: self.id)
        end
        puts "\n"
    end
    
    def remove_from_favs(fav_movie)
        sleep 1
        if self.favorites.length > 0 
            self.favorites.find_by(movie_id: fav_movie.id).destroy
            puts "You removed #{fav_movie.title}!"
            sleep 2
        else
            puts "No movies to delete!"
            sleep 2
        end
    end

    def browse_genres
        array_of_hashes = Movie.all.map {|movie| movie.genre}.uniq
        movie_genre = TTY::Prompt.new.select("What genre of movies would you like to view?", array_of_hashes)
        puts "You chose #{movie_genre}!"
        movie_by_genre = Movie.all.map {|genre| genre.title}
        puts movie_by_genre.genre
        # puts "Movies: #{Movie.find_by(genre: movie_genre).title}!"
    end 

    # def get_trailer
    #     self.movies.map do |movie|
    #         # binding.pry
    #         # movie.trailer
    #         #why is this putsing out 3 trailer links instead of 1?
    #         puts "View Trailer Here: #{movie.trailer}"
    #         sleep 4
    #     end
    # end
end
