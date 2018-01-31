require 'csv'
require_relative '../models/user.rb'

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
    @element = {}
    @element[:first_name] = row[:firstname]
    @element[:last_name] = row[:lastname]
    handle_multiple_headers(row, :email1)
    @element[:zip] = row[:zip]
    User.new(@element)
  end

  def handle_multiple_headers(row, header)
    if row.headers.include?(header)
      @element[:email_1] = row[:email1]
      @element[:email_2] = row[:email2]
      @element[:phone_1] = row[:phone1]
      @element[:phone_2] = row[:phone2]
    else
      @element[:email_1] = row[:email]
      @element[:phone_1] = row[:phone]
    end
  end
end

repo_1 = UserRepository.new('data/input1.csv')
repo_2 = UserRepository.new('data/input2.csv')

p repo_2

