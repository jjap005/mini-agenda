module MiniAgenda::Commands
  class AddContact
    def initialize(name:, phone:, email:)
      @name = name
      @phone = phone
      @email = email
    end
  end
end
