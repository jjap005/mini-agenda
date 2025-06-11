require 'singleton'
require_relative '../domains/contacts/contact'
require_relative '../queries/find_contact'
require_relative '../queries/list_contacts'
require_relative '../validators/email_validator'
require_relative '../events/contact_added'
require_relative '../events/contact_removed'
require_relative '../events/event_store'

module MiniAgenda
  module Lib
    class GenServer
      include Singleton

      def initialize
        @contacts = {}
      end

      def add_contact(name:, phone:, email:)
        key = name.strip.downcase
        raise "Duplicate contact" if @contacts.key?(key)

        contact = Domains::Contacts::Contact.new(name: name, phone: phone, email: email)
        
        MiniAgenda::Events::EventStore.instance.add_event(
          MiniAgenda::Events::ContactAdded.new({
            name: contact.name,
            phone: contact.phone,
            email: contact.email,
          })
        )

        @contacts[key] = contact
      end

      def find_contact(name:)
        @contacts[name.strip.downcase]
      end

      def remove_contact(name:)
        key = name.strip.downcase
        raise "Contact not found" unless @contacts.key?(key)

        MiniAgenda::Events::EventStore.instance.add_event(
          MiniAgenda::Events::ContactRemoved.new({
            name: name
          })
        )

        @contacts.delete(key)
      end

      def list_contacts
        @contacts.values.sort_by(&:name)
      end

      def reset!
        @contacts.clear
      end
    end
  end
end