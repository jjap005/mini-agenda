require_relative '../lib/gen_server'

module MiniAgenda
  module Commands
    class RemoveContact
      def initialize(name:)
        @name = name
      end

      def call
        MiniAgenda::Lib::GenServer.instance.remove_contact(name: @name)
      end
    end
  end
end