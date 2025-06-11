module MiniAgenda
  module Queries
    class FindContact
      def initialize(name:)
        @name = name
      end

      def call
        MiniAgenda::Lib::GenServer.instance.find_contact(name: @name)
      rescue StandardError => e
        nil
      end
    end
  end
end