require_relative 'user_base_repository.rb'

class UniqEmailRepository < UserBaseRepository
  def all
    users = []
    existing_email = []
    @elements.each do |element|
      element_emails = [element.email_1, element.email_2]
      unless existing_email.flatten.any? { |x| element_emails.include?(x) }
        users << element
        existing_email << element_emails.compact
      end
    end
    @elements = users
    save_csv
  end
end

email_repo_1 = UniqEmailRepository.new('data/input1.csv', 'data/same_email_address.csv')
email_repo_2 = UniqEmailRepository.new('data/input2.csv', 'data/same_email_address.csv')
email_repo_3 = UniqEmailRepository.new('data/input3.csv', 'data/same_email_address.csv')

email_repo_3.uniq_email
