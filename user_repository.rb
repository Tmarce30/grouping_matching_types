require 'csv'
require_relative 'user.rb'

class UserRepository
  def initialize(csv_file)
    @elements = []
    @csv_file = csv_file
    load_csv if File.exist?(@csv_file)
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_element(row)
    end
  end

  def build_element(row)
    element = {}
    element[:first_name] = row[:firstname]
    element[:last_name] = row[:lastname]
    element[:phone_1] = row[:phone1]
    element[:phone_2] = row[:phone2]
    element[:email_1] = row[:email1]
    element[:email_2] = row[:email2]
    element[:zip] = row[:zip]
    User.new(element)
  end
end

repo = UserRepository.new('input2.csv')

p repo
