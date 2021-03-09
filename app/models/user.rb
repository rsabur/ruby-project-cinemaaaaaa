class User < ActiveRecord::Base
    has_many :favorites
    has_many :movies, through :favorites 

    def self.login_helper_method
        puts "What is your username?"
        username = STDIN.gets.chomp
        puts "What is your password?"
        pass = STDIN.gets.chomp
        user_inst = User.find_by(username: username, password: pass)

        until user_inst
            sleep 1
            system 'clear'
            puts "Incorrect username or password"
            user_inst = User.login_helper_class_method
        end

        user_inst
    end

    def self.register 
        puts "What is your name?"
        name = STDIN.gets.chomp
        puts "What is your username?"
        username = STDIN.gets.chomp
        puts "What is your password?"
        pass = STDIN.gets.chomp
        user_inst = User.create(username: username, password: pass)
    end
end