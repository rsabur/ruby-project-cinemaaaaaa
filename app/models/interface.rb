class Interface
    attr_accessor :user, :favorite
    attr_reader :movie, :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "Hello!"
        sleep 1
        puts "Welcome to Cinemaaaaaa! 🎞"
        sleep 1
        puts "We're here to help you keep track of your favorite movies 🎥 and discover new ones you are sure to love! Let's get started! 🎉"
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
        @user.reload
        system 'clear'
        sleep 2
        puts "Welcome back, #{@user.name}!"
        prompt.select "Main Menu" do |menu|
            menu.choice "Browse Movies", -> {browse_movie_helper}
            menu.choice "Favorites List", -> {favorites_list_helper}
            menu.choice "Create a Favorites List", -> {create_favs_helper}
            menu.choice "Log Out", -> {puts "See ya later!"}
        end
    end

    def browse_movie_helper
        @movie.all.title
    end

    def favorites_list_helper
    end

    def create_favs_helper
    end

    def run
        welcome
        ask_for_login_or_register
        main_menu
    end
end