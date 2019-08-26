module Dotabuff
  class Client
    PARSERS = {
      HEROES_URL => Dotabuff::Parsers::Heroes
    }.freeze

    def initialize
      @mechanize = Mechanize.new { |agent| agent.follow_meta_refresh = true }
    end

    def fetch_heroes
      data = nil
      @mechanize.get(HEROES_URL) do |page|
        data = PARSERS[HEROES_URL].new(page).process
      end
      data
    end
  end
end
