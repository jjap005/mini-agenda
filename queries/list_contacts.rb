module MiniAgenda
  module Queries
    class ListContacts
      def self.call(contacts:)
        contacts.values.sort_by(&:name)
      end
    end
  end
end