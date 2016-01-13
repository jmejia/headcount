require 'csv'
require 'pry'
require_relative 'district'

class DistrictRepository
   attr_reader :districts, :district_key

  def initialize
    @districts = {}
    runner
  end

  def find_by_name(district)
    districts.find do |key, value|
      district.upcase == value.name.upcase
    end
  end

  def find_all_matching(name_fragment)
    matching = []
    districts.each do |key, value|
      if
        value.name.upcase.include?(name_fragment.upcase)
        matching << value.name
      end
    end
    matching
  end

  def parser(contents)
     contents.each do |row|
       district = row[:location]
       districts[district.to_sym] = District.new({:name => district})
     end
   end

  def load_data(enrollment_data)
     kindergarten_csv = enrollment_data[:enrollment][:kindergarten]
     contents = CSV.open kindergarten_csv, headers: true, header_converters: :symbol
     parser(contents)
  end

  def runner
    load_data({
      :enrollment => {
        :kindergarten => "../data/Kindergartners in full-day program.csv"
      }
    })
  end
end
