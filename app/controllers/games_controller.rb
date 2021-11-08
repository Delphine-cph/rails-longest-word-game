require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0..10).map { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    @word = params[:word]
    @score = if english_word?(@word) == false
               "Sorry but #{@word} does not seem to be a valid English word..."
             else
               "Congratulations! #{@word} is a valid English word!"
             end
  end

  private

  # def valid_grid?
  #   @word.
  # end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found'] = true
  end
end
