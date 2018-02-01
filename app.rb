require_relative 'app/repositories/uniq_email_repository.rb'
require_relative 'app/repositories/uniq_phone_or_email_repository.rb'
require_relative 'app/repositories/uniq_phone_repository.rb'

input_1_csv = File.join(__dir__, 'data/input1.csv')
input_2_csv = File.join(__dir__, 'data/input2.csv')
input_3_csv = File.join(__dir__, 'data/input3.csv')

output_1_uniq_email_csv = File.join(__dir__, 'data/output1_uniq_email_csv.csv')
output_2_uniq_email_csv = File.join(__dir__, 'data/output2_uniq_email_csv.csv')
output_3_uniq_email_csv = File.join(__dir__, 'data/output3_uniq_email_csv.csv')

output_1_uniq_phone_csv = File.join(__dir__, 'data/output1_uniq_phone_csv.csv')
output_2_uniq_phone_csv = File.join(__dir__, 'data/output2_uniq_phone_csv.csv')
output_3_uniq_phone_csv = File.join(__dir__, 'data/output3_uniq_phone_csv.csv')

output_1_uniq_phone_or_email_csv = File.join(__dir__, 'data/output1_uniq_phone_or_email_csv.csv')
output_2_uniq_phone_or_email_csv = File.join(__dir__, 'data/output2_uniq_phone_or_email_csv.csv')
output_3_uniq_phone_or_email_csv = File.join(__dir__, 'data/output3_uniq_phone_or_email_csv.csv')

uniq_email_repository_1 = UniqEmailRepository.new(input_1_csv, output_1_uniq_email_csv)
uniq_email_repository_2 = UniqEmailRepository.new(input_2_csv, output_2_uniq_email_csv)
uniq_email_repository_3 = UniqEmailRepository.new(input_3_csv, output_3_uniq_email_csv)

uniq_phone_repository_1 = UniqPhoneRepository.new(input_1_csv, output_1_uniq_phone_csv)
uniq_phone_repository_2 = UniqPhoneRepository.new(input_2_csv, output_2_uniq_phone_csv)
uniq_phone_repository_3 = UniqPhoneRepository.new(input_3_csv, output_3_uniq_phone_csv)

uniq_email_repository_1 = UniqPhoneOrEmailRepository.new(input_1_csv, output_1_uniq_phone_or_email_csv)
uniq_email_repository_2 = UniqPhoneOrEmailRepository.new(input_2_csv, output_2_uniq_phone_or_email_csv)
uniq_email_repository_3 = UniqPhoneOrEmailRepository.new(input_3_csv, output_3_uniq_phone_or_email_csv)
