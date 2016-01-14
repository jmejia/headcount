require "minitest/autorun"
require "minitest/pride"
require "../lib/enrollment"

class EnrollmentTest < Minitest::Test
  def test_we_can_create_an_instance
    enrollment = Enrollment.new(name: "ACADEMY 20",
                                kindergarten_participation: {
                                  2010 => 0.3915,
                                  2011 => 0.35356,
                                  2012 => 0.1234 }
                                )
    assert_equal "ACADEMY 20", enrollment.name
    assert_equal({ 2010 => 0.3915, 2011 => 0.35356, 2012 => 0.1234 },
      enrollment.kindergarten_participation)
  end
end
