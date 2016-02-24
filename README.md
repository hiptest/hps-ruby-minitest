# hps-ruby-minitest
[![Build Status](https://travis-ci.org/hiptest/hps-ruby-minitest.svg?branch=master)](https://travis-ci.org/hiptest/hps-ruby-minitest)

Hiptest publisher samples with Ruby/Rspec

In this repository you'll find tests generated in Ruby/Rspec format from [Hiptest](https://hiptest.net), using [Hiptest publisher](https://github.com/hiptest/hiptest-publisher).

The goals are:

 * to show how tests are exported in Ruby/Rspec.
 * to check exports work out of the box (well, with implemented actionwords)

System under test
------------------

The SUT is a (not that much) simple coffee machine. You start it, you ask for a coffee and you get it, sometimes. But most of times you have to add water or beans, empty the grounds. You have an automatic expresso machine at work or at home? So you know how it goes :-)

Update tests
-------------


To update the tests:

    hiptest-publisher -c minitest.conf --only=tests

The tests are generated in [``test/project_test.rb``](https://github.com/hiptest/hps-ruby-minitest/blob/master/test/project_test.rb)

Run tests
---------


To build the project and run the tests, use the following command:

    bundle exec ruby -Ilib test/project_test.rb --junit

The SUT implementation can be seen in [``src/coffee_machine.rb``](https://github.com/hiptest/hps-ruby-minitest/blob/master/src/coffee_machine.rb)

The test report is generated in ```report.xml```