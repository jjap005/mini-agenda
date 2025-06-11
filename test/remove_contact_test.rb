require_relative 'test_helper'

class RemoveContactTest < Minitest::Test
  def setup
    MiniAgenda::Lib::GenServer.instance.reset!
    MiniAgenda::Lib::GenServer.instance.add_contact(name: 'Carlos', phone: '111', email: 'carlos@mail.com')
  end

  def test_removes_contact
    assert MiniAgenda::Lib::GenServer.instance.find_contact(name: 'Carlos')
    MiniAgenda::Commands::RemoveContact.new(name: 'Carlos').call
    assert_nil MiniAgenda::Lib::GenServer.instance.find_contact(name: 'Carlos')
  end
end