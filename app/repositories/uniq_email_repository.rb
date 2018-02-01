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

