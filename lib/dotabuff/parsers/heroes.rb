module Dotabuff
  module Parsers
    class Heroes < Base
      HEROES_SELECTOR = '.hero-grid a'.freeze
      NAME_SELECTOR = '.name'.freeze
      WIN_RATE = '.win-rate'.freeze

      def process
        doc.css(HEROES_SELECTOR).map do |item|
          name = Dotabuff::Utility.select(item, NAME_SELECTOR, '') do |el|
            el.first.text
          end

          win_rate = Dotabuff::Utility.select(item, WIN_RATE, '') do |el|
            el.first.attributes['title'].value
          end

          path = item.attributes['href'].value
          main_url = URI.join(Dotabuff::MAIN_URL, path).to_s
          {
            name: name,
            main_url: main_url,
            pick_url: URI.join("#{main_url}/", Dotabuff::PICK_URL),
            win_rate: win_rate
          }
        end
      end
    end
  end
end
