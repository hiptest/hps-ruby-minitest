# encoding: UTF-8

require 'minitest/autorun'
require_relative 'actionwords'
require_relative 'test_helper'


class TestNominalCase < MiniTest::Unit::TestCase
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

  def messages_are_based_on_language(lang, ready_message)
    # Well, sometimes, you just get a coffee.
    # When I start the coffee machine "<lang>"
    i_start_the_coffee_machine(lang)
    # Then message "<ready_message>" should be displayed
    message_message_should_be_displayed(ready_message)
  end

  def test_Messages_are_based_on_language_english
    messages_are_based_on_language('en', 'Ready')
  end

  def test_Messages_are_based_on_language_french
    messages_are_based_on_language('fr', 'Pret')
  end


  def test_No_messages_are_displayed_when_machine_is_shut_down
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I shutdown the coffee machine
    i_shutdown_the_coffee_machine
    # Then message "" should be displayed
    message_message_should_be_displayed("")
  end
end