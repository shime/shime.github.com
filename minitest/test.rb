# frozen_string_literal: true

require_relative './lib/minitest/autorun'

Minitest.after_run do
  puts 'foo'
end

Minitest.after_run do
  puts 'bar'
end
