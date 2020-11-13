class EpisodesController < ApplicationController
  def index
    @episodes = FetchEpisodes.new.call
  end

  def show
    @episode = FetchEpisodes.new(params[:id]).call
    character_ids = @episode['characters'].map { |url| url.split('/')[-1] }.join(',')
    @characters_in_episode = FetchCharacters.new(character_ids).call
  end
end