module MiniAgenda
  module Queries
    class ListContacts
      def self.call
        MiniAgenda::Lib::GenServer.instance.list_contacts
      end
    end
  end
end