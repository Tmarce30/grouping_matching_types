require_relative 'user_base_repository.rb'

class UniqPhoneOrEmailRepository < UserBaseRepository
  def all
    users = []
    existing_data = []
    @elements.each do |element|
      element_data = [element.phone_1, element.phone_2, element.email_1, element.email_2]
      unless existing_data.flatten.any? { |x| element_data.include?(x) }
        users << element
        existing_data << element_data.compact
      end
    end
    @elements = users
    save_csv
  end
end



repo_1 = UniqPhoneOrEmailRepository.new('data/input1.csv', 'data/same_email_address_or_phone_number.csv')
repo_2 = UniqPhoneOrEmailRepository.new('data/input2.csv', 'data/same_email_address_or_phone_number.csv')
repo_3 = UniqPhoneOrEmailRepository.new('data/input3.csv', 'data/same_email_address_or_phone_number.csv')

repo_1.all
# phone_repo_2.uniq_phone
