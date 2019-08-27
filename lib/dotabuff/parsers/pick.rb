module Dotabuff
  module Parsers
    class Pick < Base
      HERO_LIST = '.content-inner section:nth-of-type(3) table tbody tr'
      WIN_RATE = '.header-content-container span.won'

      def process
        hero_list = @doc.css HERO_LIST
        win_rate = @doc.css WIN_RATE
        hash = { win_rate: win_rate.text }
        stat = []
        hero_list.each do |item|
          name = item.xpath('./td[1]').first.attributes['data-value'].value
          win_score = item.xpath('./td[3]').first.attributes['data-value'].value
          hero = { name: name, win_score: win_score }
          stat << hero
        end
        hash[:stat] = stat
        hash
      end
    end
  end
end
