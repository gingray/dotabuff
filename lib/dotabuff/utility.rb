module Dotabuff
  class Utility
    class << self
      def select(doc, selector, default = nil)
        val = doc.css(selector)
        return default if val.size <= 0

        yield val
      end
    end
  end
end
