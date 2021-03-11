class Interface
    attr_accessor :user, :favorite
    attr_reader :movie, :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
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
                                                                                                        ".colorize(:blue)
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
        puts "Welcome back, #{@user.name}!"
        prompt.select "Main Menu" do |menu|
            menu.choice "Browse Movies", -> {browse_movie_helper}
            menu.choice "Favorites List", -> {favorites_list_helper}
            menu.choice "Create a Favorites List", -> {create_favs_helper}
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

    def favorites_list_helper
        @user.display_favorite_movies
        prompt.select "Menu" do |menu|
            menu.choice "Main Menu", -> {main_menu}
            menu.choice "Log Out", -> {puts "See ya Later!"}
        end
    end

    def create_favs_helper
        @user.create_new_favs_list
        prompt.select "Menu" do |menu|
            menu.choice "Main Menu", -> {main_menu}
            menu.choice "Log Out", -> {puts "See ya Later!"}
        end
    end

    def run
        welcome
        ask_for_login_or_register
        main_menu
    end

    def trailer

    end
end


# https://medium.com/@sylwiavargas/adding-pictures-to-your-ruby-cli-4252b89823a