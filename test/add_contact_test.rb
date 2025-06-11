require_relative 'test_helper'

class AddContactTest < Minitest::Test
  def setup
    MiniAgenda::Lib::GenServer.instance.reset!
  end

  def test_add_contact
    MiniAgenda::Lib::GenServer.instance.add_contact(name: 'Ana', phone: '123', email: 'ana@mail.com')
    contact = MiniAgenda::Lib::GenServer.instance.find_contact(name: 'Ana')
    assert_equal 'Ana', contact.name
  end

  def test_duplicate_contact_raises
    MiniAgenda::Lib::GenServer.instance.add_contact(name: 'Bob', phone: '456', email: 'bob@mail.com')
    assert_raises RuntimeError do
      MiniAgenda::Lib::GenServer.instance.add_contact(name: 'Bob', phone: '999', email: 'otro@mail.com')
    end
  end

  def test_add_contact_with_invalid_email
    assert_raises RuntimeError do
      MiniAgenda::Lib::GenServer.instance.add_contact(name: 'Invalid', phone: '000', email: 'invalid-email')
    end
  end
end
