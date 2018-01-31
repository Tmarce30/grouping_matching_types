require 'csv'
require_relative '../models/user.rb'
require 'pry-byebug'

class UserBaseRepository
  attr_reader :elements

  def initialize(loaded_csv_file, output_csv_file)
    @elements = []
    @loaded_csv_file = loaded_csv_file
    @output_csv_file = output_csv_file
    load_csv if File.exist?(@loaded_csv_file)
  end

  private

  def save_csv
    CSV.open(@output_csv_file, 'w') do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.csv_row
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@loaded_csv_file, csv_options) do |row|
      @elements << build_element(row)
    end
  end

  def build_element(row)
    @element = {}
    @element[:first_name] = row[:firstname]
    @element[:last_name] = row[:lastname]
    email_and_phone(row, :email || :phone)
    @element[:zip] = row[:zip]
    User.new(@element)
  end

  def email_and_phone(row, header)
    if row.headers.include?(header)
      @element[:email_1] = row[:email]
      @element[:phone_1] = row[:phone]
    else
      @element[:email_1] = row[:email1]
      @element[:email_2] = row[:email2]
      @element[:phone_1] = row[:phone1]
      @element[:phone_2] = row[:phone2]
    end
  end
end

