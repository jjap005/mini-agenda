module MiniAgenda
  module Queries
    class FindContact
      def self.call(contacts:, name:)
        contacts[name.strip.downcase]
      end
    end
  end
end