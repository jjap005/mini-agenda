module MiniAgenda
  module Validators
    class EmailValidator
      def self.valid?(email)
        email.include?("@") && email.include?(".")
      end
    end
  end
end