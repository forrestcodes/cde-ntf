# Using PORO here but personal preference is to use the Interactor gem.
EPISODE_ENDPOINT = 'https://rickandmortyapi.com/api/episode'.freeze
EPISODES_TO_SHOW = 16

class FetchEpisodes
  attr_reader :episode_id

  def initialize(episode_id = nil)
    @episode_id = episode_id
  end

  def call
    url = build_request_string
    request = HTTParty.get(url)

    if episode_id.present?
      request.parsed_response
    else
      request.parsed_response['results'].slice(0, 16)
    end
  end

  private

  def build_request_string
    "#{EPISODE_ENDPOINT}/#{@episode_id.presence}"
  end
end