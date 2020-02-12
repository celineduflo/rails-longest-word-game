class GamesController < ApplicationController
  require 'json'
  require 'open-uri'

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @mot = params[:mot].chars
    @letters = params[:letters]
    @message = @letters.split(" ")
    @message2 = @letters.split(" ")

    @mot.each do |mot, index|
      if @message2.include? "#{@mot}"
        @result = true
        # @message2.delete_at(index)
      else
        @result = false
      end
      # binding.pry
    end

    if @result
      url = "https://wagon-dictionary.herokuapp.com/#{@mot.join}"
      user_serialized = open(url).read
      user = JSON.parse(user_serialized)

      if user['found'] == true
        @message = "english"
      else
        @message = "not english"
      end

    else
      @message = "Sorry but TEST cant be built out of #{@letters}"
    end

  end
end


