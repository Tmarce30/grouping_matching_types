require_relative 'user_base_repository.rb'

class UniqPhoneOrEmailRepository < UserBaseRepository
  def initialize(loaded_csv_file, output_csv_file)
    super(loaded_csv_file, output_csv_file)

    uniq_phone_or_email
  end

  private

  def uniq_phone_or_email
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

