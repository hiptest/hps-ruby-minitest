#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
task :default => :test
task :test do
  Dir.glob('./test/**/*_test.rb').each { |file| require file}
end