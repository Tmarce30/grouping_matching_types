require_relative 'user_base_repository.rb'

class UniqPhoneOrEmailRepository < UserBaseRepository
  def uniq_phone_or_email
    contact_infos = []
    existing_infos = []
    @elements.each do |element|
      element_infos = [element.phone_1, element.phone_2, element.email_1, element.email_2]
      unless existing_phone.any? { |x| element_infos.include?(x) }
        contact_infos << element
        existing_infos << element.phone_1 unless element.phone_1.nil?
        existing_infos << element.phone_2 unless element.phone_2.nil?
        existing_infos << element.email_1 unless element.email_1.nil?
        existing_infos << element.email_2 unless element.email_2.nil?
      end
    end
    save_csv(contact_infos)
  end
end
