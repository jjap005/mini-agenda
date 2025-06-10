require_relative '../../validators/email_validator'

module MiniAgenda
  module Domains
    module Contacts
      class Contact
        attr_reader :name, :phone, :email

        def initialize(name:, phone:, email:)
          raise "Invalid email" unless Validators::EmailValidator.valid?(email)
          raise "Name cannot be empty" if name.strip.empty?
          
          @name = name.strip
          @phone = phone.strip
          @email = email.strip
        end
      end
    end
  end
end