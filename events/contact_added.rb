module MiniAgenda
  module Events
    class ContactAdded < BaseEvent
      def initialize(data)
        super(type: :contact_added, data: data)
      end
    end
  end
end