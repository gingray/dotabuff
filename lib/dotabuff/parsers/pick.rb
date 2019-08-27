module Dotabuff
  module Parsers
    class Pick < Base
      HERO_LIST = '.content-inner section:nth-of-type(3) table tbody tr'.freeze
      WIN_RATE = '.header-content-container span.won'.freeze
      NAME = './td[1]'.freeze
      WIN_SCORE = './td[3]'.freeze
      WIN_RATE = './td[4]'.freeze

      def process
        hero_list = @doc.css HERO_LIST
        win_rate = @doc.css WIN_RATE
        hash = { win_rate: win_rate.text }
        stat = []
        hero_list.each do |item|
          name = item.xpath(NAME).first.attributes['data-value'].value
          win_score = item.xpath(WIN_SCORE).first.attributes['data-value'].value
          win_rate = item.xpath(WIN_RATE).first.attributes['data-value'].value
          hero = { name: name, win_score: win_score, win_rate: win_rate }
          stat << hero
        end
        hash[:stat] = stat
        hash
      end
    end
  end
end
