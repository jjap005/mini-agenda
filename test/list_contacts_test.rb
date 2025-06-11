require_relative 'test_helper'

class ListContactsQueryTest < Minitest::Test
  def setup
    MiniAgenda::Lib::GenServer.instance.reset!
    MiniAgenda::Lib::GenServer.instance.add_contact(name: 'Bruno', phone: '222', email: 'bruno@mail.com')
    MiniAgenda::Lib::GenServer.instance.add_contact(name: 'Ana', phone: '111', email: 'ana@mail.com')
  end

  def test_lists_contacts_sorted
    contacts = MiniAgenda::Lib::GenServer.instance.list_contacts
    names = contacts.map(&:name)
    assert_equal ['Ana', 'Bruno'], names
  end
end
