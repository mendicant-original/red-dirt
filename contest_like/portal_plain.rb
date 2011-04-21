class Portal
  attr_accessor :blue, :orange

  def open?
    !!(blue && orange)
  end 
end

Player = Struct.new(:location)

# note, there is minitest/spec, but comes w. a bit of baggage.

if __FILE__ == $PROGRAM_NAME
  require "minitest/autorun"

  class PortalTest < MiniTest::Unit::TestCase
    def setup
      @portal = Portal.new
    end

    def test_must_not_be_open_by_default
      refute @portal.open?
    end

    def must_not_be_open_when_just_the_orange_endpoint_is_set
      @portal.orange = [3,3,3]
      refute @portal.open?
    end

    def test_must_not_be_open_when_just_the_blue_endpoint_is_set
      @portal.blue = [5,5,5]
      refute @portal.open?
    end

    def test_must_be_open_when_both_endpoints_are_set
      @portal.orange = [3,3,3]
      @portal.blue   = [5,5,5]

      assert @portal.open?
    end

    def test_must_require_endpoints_to_be_a_3_element_array_of_numbers
      skip "must require endpoints to be a 3 element array of numbers"
    end
  end
end
