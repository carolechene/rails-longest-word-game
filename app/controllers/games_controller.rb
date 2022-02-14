# frozen_string_literal: true

require 'open-uri'

# comment
class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @score = 0
    @answer = params[:answer]
    @splitted_answer = params[:answer].split('')

    @splitted_letters = params[:letters]

    if @splitted_answer.include?(@letters)
      checking_word
    else
      "Sorry but '#{@answer}' can't be build out of '#{@answer}'"
    end
  end

  private

  def checking_word
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@answer}")
    json = JSON.parse(response.read)
    json[:found]
  end
end
