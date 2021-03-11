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
        #     system 'clear'
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
        else
            puts "No movies to display 😫"
            sleep 4
        end
    end

    def display_favorite_movies
        system 'clear'
        sleep 1
        if favorites.length > 0
            array_of_hashes = self.movies.map do |movie|
                # binding.pry
                movie.title
            end
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
        else
        puts "You don't have any movies listed 😫"
        sleep 4
        end
    end

    def create_new_favs_list
        system 'clear'
        sleep 1
        puts "Under Construction... 🚧🛠"
        sleep 1
        # binding.pry
        puts "Which movies would you like to add?"
        # binding.pry
        movie_choices = Movie.all.map {|movie| movie.title}.uniq
        new_favorite_list = TTY::Prompt.new.multi_select("Select movies:", movie_choices)
        # new_favorite_list.push(display_favorite_movies)
        puts "\n"
    end
end
