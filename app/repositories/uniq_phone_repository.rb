require_relative 'user_base_repository.rb'

class UniqPhoneRepository < UserBaseRepository
  def all
    users = []
    existing_phone = []
    @elements.each do |element|
      element_phones = [element.phone_1, element.phone_2]
      unless existing_phone.flatten.any? { |x| element_phones.include?(x) }
        users << element
        existing_phone << element_phones.compact
      end
    end
    @elements = users
    save_csv
  end
end



phone_repo_1 = UniqPhoneRepository.new('data/input1.csv', 'data/same_phone_number.csv')
phone_repo_2 = UniqPhoneRepository.new('data/input2.csv', 'data/same_phone_number.csv')
phone_repo_3 = UniqPhoneRepository.new('data/input3.csv', 'data/same_phone_number.csv')

phone_repo_3.uniq_phone
# phone_repo_2.uniq_phone
