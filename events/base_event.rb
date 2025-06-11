module MiniAgenda
  module Events
    class BaseEvent
      attr_reader :type, :data, :timestamp

      def initialize(type:, data:)
        @type = type
        @data = data
        @timestamp = Time.now
      end
    end
  end
end