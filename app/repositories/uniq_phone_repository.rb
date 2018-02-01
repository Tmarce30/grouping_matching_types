require_relative 'user_base_repository.rb'

class UniqPhoneRepository < UserBaseRepository
  def uniq_phone
    phone = []
    existing_phone = []
    @elements.each do |element|
      unless existing_phone.any? { |x| [element.phone_1, element.phone_2].include?(x) }
        phone << element
        existing_phone << element.phone_1 unless element.phone_1.nil?
        existing_phone << element.phone_2 unless element.phone_2.nil?
      end
    end
    save_csv(phone)
  end
end



phone_repo_1 = UniqPhoneRepository.new('data/input1.csv', 'data/same_phone_number.csv')
phone_repo_2 = UniqPhoneRepository.new('data/input2.csv', 'data/same_phone_number.csv')
phone_repo_3 = UniqPhoneRepository.new('data/input3.csv', 'data/same_phone_number.csv')

phone_repo_2.uniq_phone
# phone_repo_2.uniq_phone
