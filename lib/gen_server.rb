require 'singleton'

module MiniAgenda::Lib
  class GenServer
    include Singleton

    def initialize
      @contacts = {}
    end
  end
end