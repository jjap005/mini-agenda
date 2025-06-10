module MiniAgenda::Domains
  module Contacts
    class Contact
      attr_reader :name, :phone, :email

      def initialize(name:, phone:, email:)
        @name = name.strip
        @phone = phone.strip
        @email = email.strip
      end
    end
  end
end