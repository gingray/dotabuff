module Dotabuff
  class Client
    HEROES_SELECTOR = '.hero-grid a'.freeze

    def initialize
      @mechanize = Mechanize.new { |agent| agent.follow_meta_refresh = true }
    end

    def fetch
      data = nil
      @mechanize.get(HEROES_URL) do |page|
        results = page.css(HEROES_SELECTOR)
        data = results.map do |item|
          name = item.css('.name').first
          win_rate = item.css('.win-rate').first
          win_rate_value = win_rate.attributes['title'].value if win_rate

          path = item.attributes['href'].value
          {
            name: name.text,
            main_url: URI.join(Dotabuff::MAIN_URL, path).to_s,
            win_rate: win_rate_value
          }
        end
      end
      data
    end
  end
end
