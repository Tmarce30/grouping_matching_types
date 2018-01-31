require_relative 'user_base_repository.rb'

class UniqEmailRepository < UserBaseRepository
  def uniq_email
    email = []
    existing_email = []
    @elements.each do |element|
      unless existing_email.any? { |x| [element.email_1, element.email_2].include?(x) }
        email << element
        existing_email << element.email_1 unless element.email_1.nil?
        existing_email << element.email_2 unless element.email_2.nil?
      end
    end
    save_csv(email)
  end
end



email_repo_1 = UniqEmailRepository.new('data/input1.csv', 'data/same_email_address.csv')
email_repo_2 = UniqEmailRepository.new('data/input2.csv', 'data/same_email_address.csv')
email_repo_3 = UniqEmailRepository.new('data/input3.csv', 'data/same_email_address.csv')

phone_repo_1 = UniqEmailRepository.new('data/input1.csv', 'data/same_phone_number.csv')
phone_repo_2 = UniqEmailRepository.new('data/input2.csv', 'data/same_phone_number.csv')
phone_repo_3 = UniqEmailRepository.new('data/input3.csv', 'data/same_phone_number.csv')

email_repo_1.uniq_email
# phone_repo_2.uniq_phone
