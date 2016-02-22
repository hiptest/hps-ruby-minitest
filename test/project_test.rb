# encoding: UTF-8

require 'minitest/autorun'
require_relative 'actionwords'

class TestCoffeeMachineHiptestPublisherSample < MiniTest::Unit::TestCase
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

  def test_Water_runs_away
    # Simple scenario showing that after 50 coffees, the "Fill tank" message is displayed but it is still possible to have coffee until the tank is fully empty.
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When fifty coffees have been taken without filling the tank
    fifty_coffees_have_been_taken_without_filling_the_tank
    # Then message "Fill tank" should be displayed
    message_message_should_be_displayed("Fill tank")
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should be served
    coffee_should_be_served
    # When I take "10" coffees
    i_take_coffee_number_coffees(10)
    # Then coffee should not be served
    coffee_should_not_be_served
    # And message "Fill tank" should be displayed
    message_message_should_be_displayed("Fill tank")
    # When I fill the water tank
    i_fill_the_water_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end

  def test_Beans_run_out
    # Simple scenario showing that after 38 coffees, the message "Fill beans" is displayed but it is possible to take two coffees until there is no more beans.
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When thirty eight coffees are taken without filling beans
    thirty_eight_coffees_are_taken_without_filling_beans
    # Then coffee should be served
    coffee_should_be_served
    # And message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
    # When I take "2" coffees
    i_take_coffee_number_coffees(2)
    # Then coffee should be served
    coffee_should_be_served
    # And message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
  end

  def test_Full_grounds_does_not_block_coffee
    # You keep getting coffee even if the "Empty grounds" message is displayed. That said it's not a fantastic idea, you'll get ground everywhere when you'll decide to empty it.
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I take "29" coffees
    i_take_coffee_number_coffees(29)
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should be served
    coffee_should_be_served
    # And message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
    # When I fill the water tank
    i_fill_the_water_tank
    # And I fill the beans tank
    i_fill_the_beans_tank
    # And I take "20" coffees
    i_take_coffee_number_coffees(20)
    # Then coffee should be served
    coffee_should_be_served
    # And message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
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
    # Tags: plop
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I shutdown the coffee machine
    i_shutdown_the_coffee_machine
    # Then message "" should be displayed
    message_message_should_be_displayed("")
  end
end