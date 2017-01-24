# encoding: UTF-8

require 'minitest/autorun'
require_relative 'actionwords'
require_relative 'test_helper'


class TestServeCoffee < MiniTest::Unit::TestCase
  include Actionwords

  def test_Simple_use
    # Well, sometimes, you just get a coffee.
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should be served
    coffee_should_be_served
  end
end