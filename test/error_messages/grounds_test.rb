# encoding: UTF-8

require 'minitest/autorun'
require_relative '../actionwords'
require_relative '../test_helper'


class TestGrounds < MiniTest::Unit::TestCase
  include Actionwords

  def setup
      # As a coffee lover
      # I have to empty the grounds
      # So I don't end up with a total mess around the coffee machine
      # Given the coffee machine is started
      the_coffee_machine_is_started
      # And I handle everything except the grounds
      i_handle_everything_except_the_grounds
  end

  def test_Message_Empty_grounds_is_displayed_after_30_coffees_are_taken
    # When I take "30" coffees
    i_take_coffee_number_coffees(30)
    # Then message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
  end

  def test_When_the_grounds_are_emptied_message_is_removed
    # Given I take "30" coffees
    i_take_coffee_number_coffees(30)
    # When I empty the coffee grounds
    i_empty_the_coffee_grounds
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end
end