require_relative 'test_helper'

module MiniAgenda
  module Events
    class EventStoreTest < Minitest::Test
      def setup
        @store = EventStore.instance
        @store.instance_variable_set(:@events, [])
      end

      def test_add_event
        event = ContactAdded.new(name: "Alice", phone: "111-111-1111", email: "alice@mail.com")
        @store.add_event(event)

        assert_equal 1, @store.all_events.size
        assert_equal :contact_added, @store.all_events.first.type
        assert_equal "Alice", @store.all_events.first.data[:name]
      end

      def test_list_all_events
        event1 = ContactAdded.new(name: "Bob", phone: "222-222-2222", email: "bob@mail.com")
        event2 = ContactRemoved.new(name: "Alice")

        @store.add_event(event1)
        @store.add_event(event2)

        events = @store.all_events

        assert_equal 2, events.size
        assert_equal :contact_added, events[0].type
        assert_equal :contact_removed, events[1].type
      end

      def test_event_store_is_singleton
        store1 = EventStore.instance
        store2 = EventStore.instance

        # Deben ser exactamente el mismo objeto
        assert_same store1, store2

        # Agregamos evento desde store1
        event = ContactAdded.new(name: "Ana", phone: "000-000-0000", email: "ana@mail.com")
        store1.add_event(event)

        # store2 debe reflejar ese mismo evento (misma instancia)
        assert_equal 1, store2.all_events.size
        assert_equal "Ana", store2.all_events.first.data[:name]
      end
    end
  end
end