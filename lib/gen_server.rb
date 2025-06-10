require 'singleton'
require_relative '../domains/contacts/contact'

module MiniAgenda::Lib
  class GenServer
    include Singleton

    def initialize
      @contacts = {}
    end

    def add_contact(name:, phone:, email:)
      key = name.strip.downcase

      contact = Domains::Contacts::Contact.new(name: name, phone: phone, email: email)
      @contacts[key] = contact
    end
  end
end