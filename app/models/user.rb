class User < ActiveRecord::Base
    has_many :favorites
    has_many :movies, through: :favorites 

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
            movie_id = TTY::Prompt.new.select("Which movie would you like more information on?", array_of_hashes)
            puts "You chose #{movie.id}!"
        else
            puts "You don't have any movies"
        end
    end

    def display_favorite_movies
        system 'clear'
        sleep 1
        # if movies.length > 0 
        #     array_of_hashes = 
        puts "You don't have any movies listed"
    end

    def create_new_favs_list
        system 'clear'
        sleep 1
        puts "You don't have any movies listed"
    end

end