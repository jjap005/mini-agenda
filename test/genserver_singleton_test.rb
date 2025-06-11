require_relative 'test_helper'

class GenServerSingletonTest < Minitest::Test
  def test_singleton_enforces_single_instance
    instance1 = MiniAgenda::Lib::GenServer.instance
    instance2 = MiniAgenda::Lib::GenServer.instance

    assert_same instance1, instance2
  end

  def test_new_raises_error
    assert_raises NoMethodError do
      MiniAgenda::Lib::GenServer.new
    end
  end
end