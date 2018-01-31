# require 'csv'

# class UserRepository
#   def initialize(csv_file)
#     @elements = []
#     @csv_file = csv_file
#     load_csv if File.exist?(@csv_file)
#   end

#   private

#   def load_csv
#     csv_options = { headers: :first_row, header_converters: :symbol }
#     CSV.foreach(@csv_file, csv_options) do |row|
#       @elements << build_element(row)
#     end
#   end

#   def build_element(row)

#   end
# end

# repo = UserRepository.new('input1.csv')

# p repo
