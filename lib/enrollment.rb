require 'pry'
require_relative 'district'
class Enrollment
  attr_accessor :name, :school_data #:high_school_graduation_rates,

  def initialize(enrollment_data)
    @name = enrollment_data[:name]

    @school_data = {kindergarten_participation: enrollment_data[:kindergarten_participation], high_school_graduation_rates: enrollment_data[:high_school_graduation_rates]}
  end

  def kindergarten_participation
    school_data[:kindergarten_participation]
  end

  def high_school_graduation_rates
    school_data[:high_school_graduation_rates]
  end

  def kindergarten_participation_in_year(year = nil)
    if year
      school_data[:kindergarten_participation][year]
    else
      school_data[:kindergarten_participation]
    end
  end

  def graduation_rate_by_year
    high_school_graduation_rates
  end

  def graduation_rate_in_year(year)
    high_school_graduation_rates[year]
  end
end
