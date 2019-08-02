default: test
.PHONY: default

install_prerequisites:
	bundle install
.PHONY: install_prerequisites

generate_tests:
	hiptest-publisher -c minitest.conf -t "$(SECRET_TOKEN)" --without=actionwords
.PHONY: generate_tests

test: install_prerequisites
	bundle exec rake test
.PHONY: test
