# encoding: UTF-8

require 'minitest/autorun'
require_relative 'actionwords'
require_relative 'test_helper'


class TestWeirdSpecs < MiniTest::Unit::TestCase
  include Actionwords

  def test_Full_grounds_does_not_block_coffee
    # You keep getting coffee even if the "Empty grounds" message is displayed. That said it's not a fantastic idea, you'll get ground everywhere when you'll decide to empty it.
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # And I handle everything except the grounds
    i_handle_everything_except_the_grounds
    # When I take "50" coffees
    i_take_coffee_number_coffees(50)
    # Then message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
    # And coffee should be served
    coffee_should_be_served
  end
end