require 'singleton'
require_relative '../domains/contacts/contact'
require_relative '../queries/find_contact'
require_relative '../validators/email_validator'

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
        @contacts[key] = contact
      end

      def find_contact(name:)
        Queries::FindContact.call(contacts: @contacts, name: name)
      end

      def remove_contact(name:)
        key = name.strip.downcase
        raise "Contact not found" unless @contacts.key?(key)

        @contacts.delete(key)
      end
    end
  end
end