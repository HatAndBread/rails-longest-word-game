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
        puts "found: #{res["found"]}"
        if !res["found"]
          @message = "There's no such word!"
        elsif !letters_contain_word?(params[:word], params[:letters])
          @message = "Your word doesn't match the letters you were given ば〜か"
        else
          @message = "Nice!!!!!!!!"
        end
        puts letters_contain_word?(params[:word], params[:letters])
    end
    private

    def letters_contain_word?(word, letters)
      word.upcase!
      puts word
      word.each_char do |char|
        return false unless letters.include?(char)
      end
      return true
    end
end
