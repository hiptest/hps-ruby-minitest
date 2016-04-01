# encoding: UTF-8

require 'minitest/autorun'
require_relative '../actionwords'
require_relative '../test_helper'


class TestBeans < MiniTest::Unit::TestCase
  include Actionwords

  def setup
      # As a coffee lover
      # I have to put fresh beans from time to time
      # So I can have coffee when I need it
      # Given the coffee machine is started
      the_coffee_machine_is_started
      # And I handle everything except the beans
      i_handle_everything_except_the_beans
  end

  def test_Message_Fill_beans_is_displayed_after_38_coffees_are_taken
    # When I take "38" coffees
    i_take_coffee_number_coffees(38)
    # Then message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
  end

  def test_It_is_possible_to_take_40_coffees_before_there_is_really_no_more_beans
    # Given I take "40" coffees
    i_take_coffee_number_coffees(40)
    # Then coffee should be served
    coffee_should_be_served
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
    # And message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
  end

  def test_After_adding_beans_the_message_Fill_beans_disappears
    # Given I take "40" coffees
    i_take_coffee_number_coffees(40)
    # When I fill the beans tank
    i_fill_the_beans_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end
end