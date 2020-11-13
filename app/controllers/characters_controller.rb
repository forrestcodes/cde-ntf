class CharactersController < ApplicationController
  def index
    @characters = FetchCharacters.new.call
  end

  def show
    @character = FetchCharacters.new(params[:id]).call
  end
end