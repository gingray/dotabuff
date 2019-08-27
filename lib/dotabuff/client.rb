module Dotabuff
  class Client
    PARSERS = {
      HEROES_URL => Dotabuff::Parsers::Heroes,
      PICK_URL => Dotabuff::Parsers::Pick
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

    def fetch_pick(url)
      data = nil
      @mechanize.get(url) do |page|
        data = PARSERS[PICK_URL].new(page).process
      end
      data
    end
  end
end
