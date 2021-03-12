class Movie < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites

    def get_trailer
        puts "View Trailer Here: #{self.trailer}"
        system 'open', self.trailer
        sleep 4
    end
end