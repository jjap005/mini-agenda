require_relative 'base_event'

module MiniAgenda
  module Events
    class ContactRemoved < BaseEvent
      def initialize(data)
        super(type: :contact_removed, data: data)
      end
    end
  end
end