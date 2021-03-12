class Interface
    attr_accessor :user, :favorite
    attr_reader :movie, :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        system 'clear'
        play_sound
        logo
        puts "Hello!"
        sleep 1
        puts "Welcome to Cinemaaaaaa! 🎞"
        sleep 1
        puts "We're here to help you keep track of your favorite movies 🎥 and discover new ones you are sure to love! Let's get started! 🎉"
    end

    def logo
        puts "
         a88888b. oo                                                                                    
        d8'   `88                                                                                       
        88        dP 88d888b. .d8888b. 88d8b.d8b. .d8888b. .d8888b. .d8888b. .d8888b. .d8888b. .d8888b. 
        88        88 88'  `88 88ooood8 88'`88'`88 88'  `88 88'  `88 88'  `88 88'  `88 88'  `88 88'  `88 
        Y8.   .88 88 88    88 88.  ... 88  88  88 88.  .88 88.  .88 88.  .88 88.  .88 88.  .88 88.  .88 
         Y88888P' dP dP    dP `88888P' dP  dP  dP `88888P8 `88888P8 `88888P8 `88888P8 `88888P8 `88888P8 
        oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
                                                                                                        ".colorize(:red)    
                                                                                                    
    end

    def play_sound
        pid = fork{ exec 'afplay', "/Users/susanavik/Music/iTunes/iTunes Media/Music/Unknown Artist/Unknown Album/246253-frankyboomer-magic-harp.mp3"}
    end

    def ask_for_login_or_register
        prompt.select "Would you like to Login or Register?" do |menu|
            menu.choice "Login", -> {login_helper}
            menu.choice "Register", -> {register_helper}
            menu.choice "Exit", -> {puts "Goodbye!"}
        end
    end

    def login_helper
        puts "Enter Login Info"
        @user = User.login_helper_method
    end

    def register_helper
        puts "Create an Account"
        @user = User.register_helper_method
    end

    def warning_message
        puts "Incorrect Login Information"
        puts "Please Try Again"
    end

    def main_menu
        # @user.reload
        system 'clear'
        sleep 1 
        # binding.pry
        puts "Welcome back, #{@user.name}!"
        prompt.select "Main Menu" do |menu|
            menu.choice "Browse All Movies", -> {browse_movie_helper}
            menu.choice "Filter Movies", -> {browse_by_helper}
            menu.choice "Favorites List", -> {favorites_list_helper}
            menu.choice "Add Favorites", -> {add_favs_helper}
            menu.choice "Log Out", -> {puts "See Ya Later!"}
        end
    end

    def browse_movie_helper
       @user.display_movies
        prompt.select "Menu" do |menu|
            menu.choice "Watch Trailer", -> {trailer}
            menu.choice "Main Menu", -> {main_menu}
            menu.choice "Log Out", -> {puts "See ya Later!"}
        end
    end

    def browse_by_helper
        puts "How would you filter your search?"
        prompt.select "Menu" do |menu|
            menu.choice "Genre", -> {browse_genres_helper}
            menu.choice "RottenTomatoes - Fresh", -> {rt_fresh_movies_helper}
            menu.choice "RottenTomatoes - Splat", -> {rt_splat_movies_helper}
            menu.choice "Main Menu", -> {main_menu}
            menu.choice "Log Out", -> {puts "See ya Later!"}
        end
    end

    def rt_fresh_movies_helper
        @user.rt_fresh_movies
        browse_by_helper
    end

    def rt_splat_movies_helper
        @user.rt_splat_movies
        browse_by_helper
    end

    def browse_genres_helper
        @user.browse_genres
        prompt.select "Menu" do |menu|
            menu.choice "Add To Favorites", -> {add_favs_by_genre_helper}
            menu.choice "Go Back", -> {browse_by_helper}
            menu.choice "Main Menu", -> {main_menu}
            menu.choice "Log Out", -> {puts "See ya Later!"}
        end
    end

    def add_favs_by_genre_helper
        @user.add_favs_by_genre
        main_menu
    end

    def favorites_list_helper
        listed_movies = @user.display_favorite_movies
        prompt.select "Menu" do |menu|
            menu.choice "Add Review", -> {add_review_helper(listed_movies)}
            menu.choice "Remove From Favorites", -> {remove_from_favs_helper(listed_movies)}
            menu.choice "Favorite List", -> {favorites_list_helper}
            menu.choice "Main Menu", -> {main_menu}
            menu.choice "Log Out", -> {puts "See ya Later!"}
        end
    end

    def add_favs_helper
        @user.add_new_favs
        prompt.select "Menu" do |menu|
            menu.choice "Main Menu", -> {main_menu}
            menu.choice "Log Out", -> {puts "See ya Later!"}
        end
    end

    def add_review_helper(fav_movie_review)
        @user.add_review(fav_movie_review)
        main_menu
    end

    def remove_from_favs_helper(fav_movie)
        @user.remove_from_favs(fav_movie)
        main_menu
    end


    def run
        welcome
        ask_for_login_or_register
        main_menu
    end

    def trailer
        @user.get_trailer
        main_menu
    end
end


# https://medium.com/@sylwiavargas/adding-pictures-to-your-ruby-cli-4252b89823a