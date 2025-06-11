require 'singleton'
module MiniAgenda
  module Events
    class EventStore
      include Singleton

      def initialize
        @events = []
      end

      def add_event(event)
        @events << event
      end

      def all_events
        @events
      end

      def replay
        @events.each do |event|
          puts "[REPLAY] #{event.type} -> #{event.data} (#{event.timestamp})"
        end
      end
    end
  end
end