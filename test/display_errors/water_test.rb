# encoding: UTF-8

require 'minitest/autorun'
require_relative '../actionwords'
require_relative '../test_helper'


class TestWater < MiniTest::Unit::TestCase
  include Actionwords

  def setup
      # Given the coffee machine is started
      the_coffee_machine_is_started
      # And I handle everything except the water tank
      i_handle_everything_except_the_water_tank
  end

  def test_Message_Fill_water_tank_is_displayed_after_50_coffees_are_taken
    # When I take "50" coffees
    i_take_coffee_number_coffees(50)
    # Then message "Fill tank" should be displayed
    message_message_should_be_displayed("Fill tank")
  end

  def test_It_is_possible_to_take_10_coffees_after_the_message_Fill_water_tank_is_displayed
    # Given I take "60" coffees
    i_take_coffee_number_coffees(60)
    # Then coffee should be served
    coffee_should_be_served
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
  end

  def test_When_the_water_tank_is_filled_the_message_disappears
    # Given I take "55" coffees
    i_take_coffee_number_coffees(55)
    # When I fill the water tank
    i_fill_the_water_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end
end