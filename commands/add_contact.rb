require_relative '../lib/gen_server'

module MiniAgenda::Commands
  class AddContact
    def initialize(name:, phone:, email:)
      @name = name
      @phone = phone
      @email = email
    end

    def call
      MiniAgenda::Lib::GenServer.instance.add_contact(name: @name, phone: @phone, email: @email)
    end
  end
end
