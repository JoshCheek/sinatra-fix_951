# Initially tested with this shell script (syntax is fish, not bash)
# $ ruby -I . (find test -type f -name '*_test.rb' | awk '{ print "-r" $0 }') -e 'Sinatra::ShowExceptions.module_eval { def pretty(*) Array super end }'

# this needs to support 1.8.7, which doesn't load rubygems by default -- actually, on my Ruby, it doesn't even ship with rubygems!
require 'rubygems'

# Fake it out to require the new minitest instead of the old minitest
# The dependency wasn't formally specified, and it depends on ActiveSupport, which mandates the new Minitest,
# but it was written against the old minitest, so we're just making it think the old one was loaded,
# while forcing it to actually load the new one, and then faking the interface enough to appease the tests
gem 'minitest', '~> 5.1'
$LOADED_FEATURES << `gem which test/unit`.chomp # so it won't try to re-require files that don't exist anymore
$LOADED_FEATURES << 'test/unit.rb'              # 1.8.7 version of the previous line
require 'minitest/autorun'                      # the new equivalent
require 'minitest/unit'                         # the new equivalent
Test = Minitest
module Minitest::Unit::Assertions
  include Minitest::Assertions
  alias assert_raise    assert_raises
  alias assert_not_nil  assert
  attr_writer :assertions
  def assertions
    @assertions ||= 0
  end
  def assert_nothing_raised(*)
    yield
  end
end
class Test::Unit::TestCase
  include Minitest::Unit::Assertions
  class << self
    remove_method :inherited # this method will spam us with like a hundred deprecations for using the old interface
  end
end


# relevant dirs
sinatra_gemspec = Gem::Specification.find_by_path 'sinatra'
test_path       = File.join sinatra_gemspec.full_gem_path, 'test'

# fix load path :/
$LOAD_PATH.unshift sinatra_gemspec.full_gem_path

# load files that emit warnings if not explicitly required
require 'redcarpet'
require 'rdiscount'
require 'bluecloth'
require 'kramdown'
require 'maruku'

# load tests
Dir[File.join test_path, '*_test.rb'].
  reject { |file| File.basename(file) == 'rdoc_test.rb' }. # rdoc_test is broken b/c assertion matches a regex against its content
  each   { |file| require file }

# Fix test that fails due to conflation of `respond_to?` in test helper with the one in Kernel
# Nothing seems to actually depend on this method
class Test::Unit::TestCase
  remove_method :respond_to?
end

# load our code to make the tests pass
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'sinatra/fix_951'
