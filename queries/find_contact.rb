module MiniAgenda::Queries
  class FindContact
    def self.call(contacts:, name:)
      contacts[name.strip.downcase]
    end
  end
end