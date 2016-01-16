require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/headcount_analyst'
require_relative '../lib/district_repository'

class HeadCountAnalystTest < Minitest::Test

  def test_head_analyst_exists
    dr = DistrictRepository.new
    ha = HeadcountAnalyst.new(dr)

    assert ha
  end

  def test_does_head_analyst_init_with_district_repo
    dr = DistrictRepository.new
    ha = HeadcountAnalyst.new(dr)

    # assert_equal DistrictRepository, ha.dr.class
    assert_kind_of DistrictRepository, ha.dr
  end

  def test_returns_the_right_district_repo
    dr = DistrictRepository.new
    ha = HeadcountAnalyst.new(dr)

    assert_equal dr.find_by_name("ACADEMY 20").name, ha.dr.find_by_name("ACADEMY 20").name
  end

end
