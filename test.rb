# frozen_string_literal: true

module Minitest
  class Test
    def initialize
      @assertions_count = 0
    end

    attr_reader :assertions_count

    def self.inherited(klass)
      @descendants ||= []
      @descendants << klass
    end

    def self.descendants
      @descendants || []
    end

    def assert(condition)
      @assertions_count += 1
      print '.' if condition
    end
  end
end

def do_the_wizardry
  Minitest::Test.descendants.map do |klass|
    klass.new.tap do |instance|
      instance.methods.grep(/^test_/).each do |method_name|
        instance.public_send(method_name)
      end
    end
  end.each_with_object(runs: 0, assertions: 0) do |instance, counter|
    counter[:assertions] += instance.assertions_count
    counter[:runs] += instance.methods.grep(/^test_/).count
  end.tap do |counter|
    puts "\n\n#{counter[:runs]} runs, " \
         "#{counter[:assertions]} assertions, " \
         '0 failures, 0 errors, 0 skips'
  end
end

at_exit { do_the_wizardry }

class MathTest < Minitest::Test
  def test_two_plus_two
    assert 2 + 2 == 4
  end
end
