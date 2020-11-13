# Using PORO here but personal preference is to use the Interactor gem.
CHARACTER_ENDPOINT = 'https://rickandmortyapi.com/api/character'.freeze
CHARACTERS_TO_SHOW = 24

class FetchCharacters
  attr_accessor :characters, :page
  attr_reader :character_id

  def initialize(character_id = nil)
    @characters = []
    @page = 1
    @character_id = character_id
  end

  def call
    if character_id.present?
      fetch_character
    else
      fetch_character_list
    end
  end

  private

  def fetch_character
    url = build_request_string
    HTTParty.get(url).parsed_response
  end

  def fetch_character_list
    return characters if characters.length >= CHARACTERS_TO_SHOW

    url = build_request_string
    self.characters += HTTParty.get(url).parsed_response['results'].slice(0, (CHARACTERS_TO_SHOW - characters.length))
    self.page += 1

    fetch_character_list
  end

  def build_request_string
    "#{CHARACTER_ENDPOINT}/#{@character_id.presence || page_number_param}"
  end

  def page_number_param
    "?page=#{page}" if page.present?
  end

end