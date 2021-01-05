class PagesController < ApplicationController
    def home
    end
    def new
      letters = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
      @game_letters = []
      12.times do
        @game_letters << letters.sample
      end
    end

    def score
        data = Faraday.get 'https://wagon-dictionary.herokuapp.com/' + params[:word]
        res = JSON.parse(data.body)
        if (data[:found])
        else
            @message = "There's no such word!"
        end
    end
    
end
