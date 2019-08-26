module Dotabuff
  module Parsers
    class Base
      attr_accessor :doc

      def initialize doc
        @doc = doc
      end

      def process
        raise NotImplementedError
      end
    end
  end
end
