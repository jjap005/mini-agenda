module MiniAgenda
  module Presenters
    class ContactPresenter
      def initialize(contact)
        @contact = contact
      end

      def to_text
        "#{@contact.name.upcase} | #{@contact.phone} | #{@contact.email}"
      end

      def to_json(*_args)
        {
          name: @contact.name,
          phone: @contact.phone,
          email: @contact.email
        }.to_json
      end
    end
  end
end