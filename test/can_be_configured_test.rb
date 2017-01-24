# encoding: UTF-8

require 'minitest/autorun'
require_relative 'actionwords'
require_relative 'test_helper'


class TestCanBeConfigured < MiniTest::Unit::TestCase
  include Actionwords

  def test_Display_settings
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I switch to settings mode
    i_switch_to_settings_mode
    # Then displayed message is:
    displayed_message_is("Settings:\n - 1: water hardness\n - 2: grinder")
  end

  def test_Default_settings
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I switch to settings mode
    i_switch_to_settings_mode
    # Then settings should be: "| water hardness | 2      |
    # | grinder        | medium |"
    settings_should_be("| water hardness | 2      |\n| grinder        | medium |")
  end
end