require_relative 'user_base_repository.rb'

class UniqPhoneRepository < UserBaseRepository
  def initialize(loaded_csv_file, output_csv_file)
    super(loaded_csv_file, output_csv_file)

    uniq_phones
  end

  private

  def uniq_phones
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

