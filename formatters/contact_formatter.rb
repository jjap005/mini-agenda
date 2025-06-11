require 'json'
require_relative '../presenters/contact_presenter'

module MiniAgenda
  module Formatters
    class ContactFormatter
      def self.to_text(contact_or_contacts)
        wrap(contact_or_contacts).map(&:to_text).join("\n")
      end

      def self.to_json(contact_or_contacts)
        if contact_or_contacts.is_a?(Array)
          contact_or_contacts.map { |c| Presenters::ContactPresenter.new(c).to_json }
        else
          Presenters::ContactPresenter.new(contact_or_contacts).to_json
        end
      end

      def self.wrap(data)
        Array(data).map { |c| Presenters::ContactPresenter.new(c) }
      end
    end
  end
end